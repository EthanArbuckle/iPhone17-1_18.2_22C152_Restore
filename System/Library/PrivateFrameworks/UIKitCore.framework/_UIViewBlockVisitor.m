@interface _UIViewBlockVisitor
- (BOOL)_visitView:(id)a3;
- (_UIViewBlockVisitor)initWithTraversalDirection:(unint64_t)a3 visitorBlock:(id)a4;
- (id)visitorBlock;
- (void)dealloc;
- (void)setVisitorBlock:(id)a3;
@end

@implementation _UIViewBlockVisitor

- (BOOL)_visitView:(id)a3
{
  if (![(_UIViewBlockVisitor *)self visitorBlock]) {
    return 1;
  }
  v4 = *(uint64_t (**)(void))([(_UIViewBlockVisitor *)self visitorBlock] + 16);
  return v4();
}

- (id)visitorBlock
{
  return self->_visitorBlock;
}

- (_UIViewBlockVisitor)initWithTraversalDirection:(unint64_t)a3 visitorBlock:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIViewBlockVisitor;
  v5 = [(_UIViewVisitor *)&v8 initWithTraversalDirection:a3];
  v6 = v5;
  if (v5) {
    [(_UIViewBlockVisitor *)v5 setVisitorBlock:a4];
  }
  return v6;
}

- (void)setVisitorBlock:(id)a3
{
}

- (void)dealloc
{
  id visitorBlock = self->_visitorBlock;
  if (visitorBlock) {

  }
  v4.receiver = self;
  v4.super_class = (Class)_UIViewBlockVisitor;
  [(_UIViewBlockVisitor *)&v4 dealloc];
}

@end