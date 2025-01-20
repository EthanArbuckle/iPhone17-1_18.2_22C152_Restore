@interface PXPeopleBadgeViewConfiguration
- (PXPeopleBadgeViewConfiguration)initWithState:(int64_t)a3 displayScale:(double)a4 badgeViewDelegate:(id)a5;
- (PXPeopleBadgeViewDelegate)badgeViewDelegate;
- (double)displayScale;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)state;
@end

@implementation PXPeopleBadgeViewConfiguration

- (void).cxx_destruct
{
}

- (PXPeopleBadgeViewDelegate)badgeViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_badgeViewDelegate);
  return (PXPeopleBadgeViewDelegate *)WeakRetained;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (int64_t)state
{
  return self->_state;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[PXPeopleBadgeViewConfiguration allocWithZone:a3];
  int64_t v5 = [(PXPeopleBadgeViewConfiguration *)self state];
  [(PXPeopleBadgeViewConfiguration *)self displayScale];
  double v7 = v6;
  v8 = [(PXPeopleBadgeViewConfiguration *)self badgeViewDelegate];
  v9 = [(PXPeopleBadgeViewConfiguration *)v4 initWithState:v5 displayScale:v8 badgeViewDelegate:v7];

  return v9;
}

- (PXPeopleBadgeViewConfiguration)initWithState:(int64_t)a3 displayScale:(double)a4 badgeViewDelegate:(id)a5
{
  id v9 = a5;
  v10 = v9;
  if (a4 <= 0.0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXPeopleBadgeViewConfiguration.m", 14, @"Invalid parameter not satisfying: %@", @"displayScale > 0" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  else if (v9)
  {
    goto LABEL_3;
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PXPeopleBadgeViewConfiguration.m", 15, @"Invalid parameter not satisfying: %@", @"badgeViewDelegate" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PXPeopleBadgeViewConfiguration;
  v11 = [(PXPeopleBadgeViewConfiguration *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_state = a3;
    v11->_displayScale = a4;
    objc_storeWeak((id *)&v11->_badgeViewDelegate, v10);
  }

  return v12;
}

@end