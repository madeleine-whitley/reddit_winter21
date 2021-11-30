import React from 'react';

//controller index should match in
// the Filename, the component name
//props are properties passed into the component from the controller 
// and export name 
//const subs = ({props, keys}) =>
const Subs = ({ subs }) => {
  return (
    <>
      <h1>Subs Page</h1>
      <a href="/subs/new">Add Sub</a>
      { subs.map( (sub) => (
        <>
          <h3>{sub.name}</h3>
          <a href={`/subs/${sub.id}`}>Show</a>
          <a href={`/subs/${sub.id}/edit`}>Edit</a>
          <a href={`/subs/${sub.id}`} data-method='delete'>
            Delete
          </a>
        </>
      )) }
    </>
  )
}

export default Subs;