@interface _SCRCStackNode
- (_SCRCStackNode)next;
- (_SCRCStackNode)prev;
- (id)object;
- (void)setNext:(id)a3;
- (void)setObject:(id)a3;
- (void)setPrev:(id)a3;
@end

@implementation _SCRCStackNode

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (_SCRCStackNode)prev
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prev);
  return (_SCRCStackNode *)WeakRetained;
}

- (void)setPrev:(id)a3
{
}

- (_SCRCStackNode)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
  objc_destroyWeak((id *)&self->_prev);
  objc_storeStrong(&self->_object, 0);
}

@end