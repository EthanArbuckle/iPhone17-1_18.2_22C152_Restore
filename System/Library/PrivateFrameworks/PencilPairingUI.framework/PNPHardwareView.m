@interface PNPHardwareView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PNPHardwareView)initWithFrame:(CGRect)a3;
- (unint64_t)animationType;
- (void)layoutSubviews;
- (void)setAnimationType:(unint64_t)a3;
@end

@implementation PNPHardwareView

- (void)layoutSubviews
{
  pencilView = self->_pencilView;
  [(PNPHardwareView *)self bounds];

  -[PNPPencilView setFrame:](pencilView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PNPPencilView sizeThatFits:](self->_pencilView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setAnimationType:(unint64_t)a3
{
  if (self->_animationType != a3)
  {
    self->_animationType = a3;
    [(PNPSyntheticPencilInteractionEventSource *)self->_eventSource stop];
    [(PNPSyntheticPencilInteractionEventSource *)self->_eventSource setEventDestination:0];
    v5 = 0;
    if (a3 == 1) {
      v5 = objc_alloc_init(PNPQuickSwapEventSource);
    }
    [(PNPSyntheticPencilInteractionEventSource *)v5 setEventDestination:self->_pencilView];
    [(PNPSyntheticPencilInteractionEventSource *)v5 play];
    eventSource = self->_eventSource;
    self->_eventSource = &v5->super;

    [(PNPHardwareView *)self setNeedsLayout];
  }
}

- (PNPHardwareView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PNPHardwareView;
  double v3 = -[PNPHardwareView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = [[PNPPencilView alloc] initWithVariant:1];
  pencilView = v3->_pencilView;
  v3->_pencilView = v4;

  v6 = v3->_pencilView;
  v7 = objc_opt_new();
  [(PNPPencilView *)v6 setDeviceState:v7];

  [(PNPHardwareView *)v3 addSubview:v3->_pencilView];
  return v3;
}

- (unint64_t)animationType
{
  return self->_animationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSource, 0);

  objc_storeStrong((id *)&self->_pencilView, 0);
}

@end