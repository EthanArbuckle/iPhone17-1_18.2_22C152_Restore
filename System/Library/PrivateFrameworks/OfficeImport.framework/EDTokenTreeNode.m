@interface EDTokenTreeNode
+ (id)tokenTreeNodeWithIndexAndType:(unsigned int)a3 type:(int)a4;
- (EDTokenTreeNode)init;
- (EDTokenTreeNode)initWithIndexAndType:(unsigned int)a3 type:(int)a4;
- (id)description;
- (id)firstChild;
- (id)sibling;
- (unsigned)tokenIndex;
- (void)setFirstChild:(id)a3;
- (void)setSibling:(id)a3;
@end

@implementation EDTokenTreeNode

+ (id)tokenTreeNodeWithIndexAndType:(unsigned int)a3 type:(int)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIndexAndType:*(void *)&a3 type:*(void *)&a4];
  return v4;
}

- (EDTokenTreeNode)initWithIndexAndType:(unsigned int)a3 type:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EDTokenTreeNode;
  result = [(EDTokenTreeNode *)&v7 init];
  if (result)
  {
    result->mTokenIndex = a3;
    result->mTokenType = a4;
  }
  return result;
}

- (unsigned)tokenIndex
{
  return self->mTokenIndex;
}

- (void)setFirstChild:(id)a3
{
  v5 = (EDTokenTreeNode *)a3;
  mFirstChild = self->mFirstChild;
  p_mFirstChild = &self->mFirstChild;
  if (mFirstChild != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mFirstChild, a3);
    v5 = v8;
  }
}

- (void)setSibling:(id)a3
{
  v5 = (EDTokenTreeNode *)a3;
  mSibling = self->mSibling;
  p_mSibling = &self->mSibling;
  if (mSibling != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mSibling, a3);
    v5 = v8;
  }
}

- (id)firstChild
{
  return self->mFirstChild;
}

- (id)sibling
{
  return self->mSibling;
}

- (EDTokenTreeNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDTokenTreeNode;
  result = [(EDTokenTreeNode *)&v3 init];
  if (result) {
    *(void *)&result->mTokenIndex = 0xFFFFFFFFLL;
  }
  return result;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDTokenTreeNode;
  v2 = [(EDTokenTreeNode *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSibling, 0);
  objc_storeStrong((id *)&self->mFirstChild, 0);
}

@end