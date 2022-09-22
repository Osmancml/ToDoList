// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;



contract TodoList {
    struct Todo{
        string text;
        bool completed;
    }

    Todo[] public todos; // creating an array
    function create(string calldata _text) external{  //provide to input a text
            todos.push(Todo({
            text: _text,
            completed: false
        }));

    }
    function updateText(uint _index, string calldata _text) external{
        todos[_index].text = _text; // if you use one field that would be cheaper

        Todo storage todo = todos[_index];
        todo.text = _text; // it would be cheaper for multiple update

    }
    function get(uint _index) external view returns(string memory, bool) {
        Todo storage todo = todos[_index]; // you can use memory instead of storage but it would be waste more gas
        return (todo.text, todo.completed);
    }
    function toggleCompleted(uint256 _index) external{
        todos[_index].completed = !(todos[_index].completed);
        
    }



}