@interface MapsEdgeConstraints
+ (id)edgeConstraintsWithTop:(id)a3 leading:(id)a4 bottom:(id)a5 trailing:(id)a6;
- (NSArray)allConstraints;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)leftConstraint;
- (NSLayoutConstraint)rightConstraint;
- (NSLayoutConstraint)topConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (void)setBottomConstraint:(id)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setLeftConstraint:(id)a3;
- (void)setRightConstraint:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)setTrailingConstraint:(id)a3;
@end

@implementation MapsEdgeConstraints

+ (id)edgeConstraintsWithTop:(id)a3 leading:(id)a4 bottom:(id)a5 trailing:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(MapsEdgeConstraints);
  [(MapsEdgeConstraints *)v13 setTopConstraint:v12];

  [(MapsEdgeConstraints *)v13 setLeadingConstraint:v11];
  [(MapsEdgeConstraints *)v13 setBottomConstraint:v10];

  [(MapsEdgeConstraints *)v13 setTrailingConstraint:v9];
  return v13;
}

- (NSArray)allConstraints
{
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  v4 = [(MapsEdgeConstraints *)self topConstraint];

  if (v4)
  {
    v5 = [(MapsEdgeConstraints *)self topConstraint];
    [v3 addObject:v5];
  }
  v6 = [(MapsEdgeConstraints *)self leftConstraint];

  if (v6)
  {
    uint64_t v7 = [(MapsEdgeConstraints *)self leftConstraint];
  }
  else
  {
    v8 = [(MapsEdgeConstraints *)self leadingConstraint];

    if (!v8) {
      goto LABEL_8;
    }
    uint64_t v7 = [(MapsEdgeConstraints *)self leadingConstraint];
  }
  id v9 = (void *)v7;
  [v3 addObject:v7];

LABEL_8:
  id v10 = [(MapsEdgeConstraints *)self bottomConstraint];

  if (v10)
  {
    id v11 = [(MapsEdgeConstraints *)self bottomConstraint];
    [v3 addObject:v11];
  }
  id v12 = [(MapsEdgeConstraints *)self rightConstraint];

  if (v12)
  {
    uint64_t v13 = [(MapsEdgeConstraints *)self rightConstraint];
  }
  else
  {
    v14 = [(MapsEdgeConstraints *)self trailingConstraint];

    if (!v14) {
      goto LABEL_15;
    }
    uint64_t v13 = [(MapsEdgeConstraints *)self trailingConstraint];
  }
  v15 = (void *)v13;
  [v3 addObject:v13];

LABEL_15:
  v16 = (void *)[v3 copy];

  return (NSArray *)v16;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)leftConstraint
{
  return self->_leftConstraint;
}

- (void)setLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)rightConstraint
{
  return self->_rightConstraint;
}

- (void)setRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_rightConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
}

@end