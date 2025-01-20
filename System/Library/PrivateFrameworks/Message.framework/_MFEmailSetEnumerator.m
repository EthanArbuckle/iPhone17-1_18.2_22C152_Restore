@interface _MFEmailSetEnumerator
- (_MFEmailSetEnumerator)initWithSet:(id)a3;
- (id)nextObject;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation _MFEmailSetEnumerator

- (_MFEmailSetEnumerator)initWithSet:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_MFEmailSetEnumerator;
  v4 = [(_MFEmailSetEnumerator *)&v6 init];
  if (v4) {
    v4->_set = (MFEmailSet *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MFEmailSetEnumerator;
  [(_MFEmailSetEnumerator *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(MFEmailSet *)self->_set countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)nextObject
{
  objc_super v3 = (void *)0xAAAAAAAAAAAAAAAALL;
  if ([(MFEmailSet *)self->_set countByEnumeratingWithState:&self->_state objects:&v3 count:1])
  {
    return v3;
  }
  else
  {
    return 0;
  }
}

@end