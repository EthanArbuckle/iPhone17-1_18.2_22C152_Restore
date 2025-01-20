@interface TLTimelineNode
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToObject:(id)a3 includingLeftNodes:(BOOL)a4 includingRightNodes:(BOOL)a5;
- (TLTimelineNode)initWithCoder:(id)a3;
- (TLTimelineNode)leftNode;
- (TLTimelineNode)rightNode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithZone:(_NSZone *)a3 copyLeftNodes:(BOOL)a4 copyRightNodes:(BOOL)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLeftNode:(id)a3;
- (void)setRightNode:(id)a3;
@end

@implementation TLTimelineNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = [(TLTimelineNode *)v4 leftNode];
  [v7 encodeObject:v5 forKey:@"leftNode"];

  v6 = [(TLTimelineNode *)v4 rightNode];
  [v7 encodeObject:v6 forKey:@"rightNode"];

  objc_sync_exit(v4);
}

- (TLTimelineNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLTimelineNode;
  v5 = [(TLTimelineNode *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leftNode"];
    [(TLTimelineNode *)v5 setLeftNode:v6];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rightNode"];
    [(TLTimelineNode *)v5 setRightNode:v7];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [(TLTimelineNode *)self copyWithZone:a3 copyLeftNodes:1 copyRightNodes:1];
}

- (id)copyWithZone:(_NSZone *)a3 copyLeftNodes:(BOOL)a4 copyRightNodes:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  objc_super v9 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v10 = self;
  objc_sync_enter(v10);
  if (!v6)
  {
    id v11 = 0;
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    id v12 = 0;
    goto LABEL_6;
  }
  id v11 = [(TLTimelineNode *)v10->_leftNode copyWithZone:a3 copyLeftNodes:1 copyRightNodes:0];
  [v11 setRightNode:v9];
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = [(TLTimelineNode *)v10->_rightNode copyWithZone:a3 copyLeftNodes:0 copyRightNodes:1];
  [v12 setLeftNode:v9];
LABEL_6:
  objc_sync_exit(v10);

  [v9 setLeftNode:v11];
  [v9 setRightNode:v12];

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TLTimelineNode *)self leftNode];
  if (v3)
  {
    id v4 = [(TLTimelineNode *)self rightNode];

    if (v4) {
      unint64_t v3 = 0;
    }
    else {
      unint64_t v3 = 4112;
    }
  }
  BOOL v5 = [(TLTimelineNode *)self leftNode];
  if (v5)
  {
  }
  else
  {
    BOOL v6 = [(TLTimelineNode *)self rightNode];

    if (v6) {
      unint64_t v3 = 4097;
    }
  }
  uint64_t v7 = [(TLTimelineNode *)self leftNode];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(TLTimelineNode *)self rightNode];

    if (v9) {
      return 4113;
    }
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return [(TLTimelineNode *)self isEqualToObject:a3 includingLeftNodes:1 includingRightNodes:1];
}

- (BOOL)isEqualToObject:(id)a3 includingLeftNodes:(BOOL)a4 includingRightNodes:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v6)
    {
      objc_super v9 = [(TLTimelineNode *)self leftNode];
      v10 = [v8 leftNode];
      if (v9 != v10
        && ![v9 isEqualToObject:v10 includingLeftNodes:1 includingRightNodes:0])
      {
        char v11 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    if (v5)
    {
      objc_super v9 = [(TLTimelineNode *)self rightNode];
      v10 = [v8 rightNode];
      if (v9 == v10) {
        char v11 = 1;
      }
      else {
        char v11 = [v9 isEqualToObject:v10 includingLeftNodes:0 includingRightNodes:1];
      }
      goto LABEL_13;
    }
    char v11 = 1;
  }
  else
  {
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

- (TLTimelineNode)leftNode
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_leftNode;
  objc_sync_exit(v2);

  return v3;
}

- (TLTimelineNode)rightNode
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_rightNode;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLeftNode:(id)a3
{
  BOOL v6 = (TLTimelineNode *)a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  if (v5->_leftNode != v6 && !-[TLTimelineNode isEqual:](v6, "isEqual:")) {
    objc_storeStrong((id *)&v5->_leftNode, a3);
  }
  objc_sync_exit(v5);
}

- (void)setRightNode:(id)a3
{
  BOOL v6 = (TLTimelineNode *)a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  if (v5->_rightNode != v6 && !-[TLTimelineNode isEqual:](v6, "isEqual:")) {
    objc_storeStrong((id *)&v5->_rightNode, a3);
  }
  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightNode, 0);
  objc_storeStrong((id *)&self->_leftNode, 0);
}

@end