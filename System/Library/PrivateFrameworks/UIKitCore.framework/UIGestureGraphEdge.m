@interface UIGestureGraphEdge
- (BOOL)isDirected;
- (BOOL)isLoop;
- (UIGestureGraphEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 directed:(BOOL)a6;
- (UIGestureGraphNode)sourceNode;
- (UIGestureGraphNode)targetNode;
- (id)commonNode:(id)a3;
- (id)description;
- (id)oppositeNode:(id)a3;
@end

@implementation UIGestureGraphEdge

- (UIGestureGraphNode)sourceNode
{
  return self->_sourceNode;
}

- (UIGestureGraphEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 directed:(BOOL)a6
{
  if (a4)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UIGestureGraphEdge.m", 27, @"Invalid parameter not satisfying: %@", @"sourceNode" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"UIGestureGraphEdge.m", 28, @"Invalid parameter not satisfying: %@", @"targetNode" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)UIGestureGraphEdge;
  v12 = [(UIGestureGraphElement *)&v17 initWithLabel:a3];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourceNode, a4);
    objc_storeStrong((id *)&v13->_targetNode, a5);
    v13->_directed = a6;
  }
  return v13;
}

- (BOOL)isLoop
{
  return self->_sourceNode == self->_targetNode;
}

- (UIGestureGraphNode)targetNode
{
  return self->_targetNode;
}

- (id)oppositeNode:(id)a3
{
  targetNode = self->_targetNode;
  if (self->_sourceNode != a3)
  {
    if (targetNode != a3)
    {
      v4 = 0;
      goto LABEL_6;
    }
    targetNode = self->_sourceNode;
  }
  v4 = targetNode;
LABEL_6:
  return v4;
}

- (BOOL)isDirected
{
  return self->_directed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNode, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
}

- (id)commonNode:(id)a3
{
  p_sourceNode = (id *)&self->_sourceNode;
  sourceNode = self->_sourceNode;
  v7 = [a3 sourceNode];
  if ([(UIGestureGraphNode *)sourceNode isEqual:v7]) {
    goto LABEL_4;
  }
  id v8 = *p_sourceNode;
  v9 = [a3 targetNode];
  LOBYTE(v8) = [v8 isEqual:v9];

  if (v8)
  {
LABEL_5:
    id v11 = *p_sourceNode;
    goto LABEL_6;
  }
  p_sourceNode = (id *)&self->_targetNode;
  targetNode = self->_targetNode;
  v7 = [a3 sourceNode];
  if ([(UIGestureGraphNode *)targetNode isEqual:v7])
  {
LABEL_4:

    goto LABEL_5;
  }
  id v13 = *p_sourceNode;
  v14 = [a3 targetNode];
  LOBYTE(v13) = [v13 isEqual:v14];

  if (v13) {
    goto LABEL_5;
  }
  id v11 = 0;
LABEL_6:
  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(UIGestureGraphEdge *)self isDirected];
  v12.receiver = self;
  v12.super_class = (Class)UIGestureGraphEdge;
  v7 = [(UIGestureGraphElement *)&v12 description];
  id v8 = [(UIGestureGraphEdge *)self sourceNode];
  v9 = [(UIGestureGraphEdge *)self targetNode];
  v10 = [v3 stringWithFormat:@"[<%@ %p>] directed:[%d] %@\n\tsourceNode:%@\n\ttargetNode:%@", v5, self, v6, v7, v8, v9];

  return v10;
}

@end