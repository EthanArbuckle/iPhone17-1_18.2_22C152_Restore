@interface _UIPopoverViewBackgroundComponentView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (NSString)directionSelector;
- (id)_newReplicant;
- (id)replicate;
- (void)setDirectionSelector:(id)a3;
- (void)updateReplicants;
@end

@implementation _UIPopoverViewBackgroundComponentView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"contents"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIPopoverViewBackgroundComponentView;
    BOOL v5 = [(UIView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (id)_newReplicant
{
  if (!self->_replicants)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    replicants = self->_replicants;
    self->_replicants = v3;
  }
  id v5 = objc_alloc((Class)objc_opt_class());
  [(UIView *)self frame];
  v6 = objc_msgSend(v5, "initWithFrame:");
  [(NSMutableArray *)self->_replicants addObject:v6];
  return v6;
}

- (id)replicate
{
  id v3 = [(_UIPopoverViewBackgroundComponentView *)self _newReplicant];
  [v3 setDirectionSelector:self->_directionSelector];
  id v4 = [(UIView *)self layer];
  id v5 = [v4 contents];
  v6 = [v3 layer];
  [v6 setContents:v5];

  objc_super v7 = [(UIView *)self layer];
  [v7 contentsRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v3 layer];
  objc_msgSend(v16, "setContentsRect:", v9, v11, v13, v15);

  v17 = [(UIView *)self layer];
  [v17 contentsCenter];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [v3 layer];
  objc_msgSend(v26, "setContentsCenter:", v19, v21, v23, v25);

  v27 = [(UIView *)self layer];
  [v27 contentsScale];
  double v29 = v28;
  v30 = [v3 layer];
  [v30 setContentsScale:v29];

  v31 = [(UIView *)self layer];
  uint64_t v32 = [v31 edgeAntialiasingMask];
  v33 = [v3 layer];
  [v33 setEdgeAntialiasingMask:v32];

  return v3;
}

- (void)updateReplicants
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_replicants;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        [(UIView *)self frame];
        objc_msgSend(v8, "setFrame:");
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (NSString)directionSelector
{
  return self->_directionSelector;
}

- (void)setDirectionSelector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionSelector, 0);
  objc_storeStrong((id *)&self->_replicants, 0);
}

@end