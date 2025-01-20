@interface TPControl
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)isAccessiblityConstraintsEnabled;
- (BOOL)isConstraintsLoaded;
- (TPControl)init;
- (TPControl)initWithCoder:(id)a3;
- (TPControl)initWithFrame:(CGRect)a3;
- (void)commonInit;
- (void)setAccessiblityConstraintsEnabled:(BOOL)a3;
- (void)setConstraintsLoaded:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)unloadConstraints;
- (void)updateConstraints;
@end

@implementation TPControl

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (TPControl)init
{
  return -[TPControl initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (TPControl)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPControl;
  v3 = -[TPControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(TPControl *)v3 commonInit];
  }
  return v4;
}

- (TPControl)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPControl;
  v3 = [(TPControl *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(TPControl *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  id v3 = [(TPControl *)self traitCollection];
  self->_accessiblityConstraintsEnabled = [v3 isPreferredContentSizeCategoryAccessible];
}

- (void)unloadConstraints
{
  id v3 = [(TPControl *)self constraints];
  [(TPControl *)self removeConstraints:v3];

  [(TPControl *)self setConstraintsLoaded:0];
}

- (void)updateConstraints
{
  if (![(TPControl *)self isConstraintsLoaded])
  {
    [(TPControl *)self updateFonts];
    [(TPControl *)self loadConstraints];
    [(TPControl *)self setConstraintsLoaded:1];
  }
  v3.receiver = self;
  v3.super_class = (Class)TPControl;
  [(TPControl *)&v3 updateConstraints];
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TPControl;
  id v4 = a3;
  [(TPControl *)&v11 traitCollectionDidChange:v4];
  v5 = [(TPControl *)self traitCollection];
  objc_super v6 = [v4 preferredContentSizeCategory];

  v7 = [v5 preferredContentSizeCategory];

  if (v6 != v7)
  {
    uint64_t v8 = [v5 isPreferredContentSizeCategoryAccessible];
    v9 = (void *)*MEMORY[0x1E4FB27F0];
    int v10 = v8 ^ [(TPControl *)self isAccessiblityConstraintsEnabled];
    if (v6 == v9)
    {
      if (v10) {
        self->_accessiblityConstraintsEnabled = v8;
      }
    }
    else
    {
      if (v10) {
        [(TPControl *)self setAccessiblityConstraintsEnabled:v8];
      }
      [(TPControl *)self updateFonts];
      [(TPControl *)self updateConstraintsConstants];
    }
  }
}

- (void)setAccessiblityConstraintsEnabled:(BOOL)a3
{
  if (self->_accessiblityConstraintsEnabled != a3)
  {
    self->_accessiblityConstraintsEnabled = a3;
    [(TPControl *)self unloadConstraints];
    [(TPControl *)self updateConstraints];
  }
}

- (BOOL)isAccessiblityConstraintsEnabled
{
  return self->_accessiblityConstraintsEnabled;
}

- (BOOL)isConstraintsLoaded
{
  return self->_constraintsLoaded;
}

- (void)setConstraintsLoaded:(BOOL)a3
{
  self->_constraintsLoaded = a3;
}

@end