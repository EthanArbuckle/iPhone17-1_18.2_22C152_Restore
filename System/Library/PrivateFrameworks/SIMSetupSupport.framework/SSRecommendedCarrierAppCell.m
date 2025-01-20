@interface SSRecommendedCarrierAppCell
+ (id)sharedLockupViewGroup;
- (ASCLockupView)lockupView;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (SSRecommendedCarrierAppCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_dummyArtwork;
- (id)_dummyLockup;
- (void)prepareForReuse;
- (void)setLockupRequest:(id)a3 withDelegate:(id)a4;
- (void)setLockupView:(id)a3;
@end

@implementation SSRecommendedCarrierAppCell

+ (id)sharedLockupViewGroup
{
  if (sharedLockupViewGroup_onceToken != -1) {
    dispatch_once(&sharedLockupViewGroup_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)sharedLockupViewGroup_group;
  return v2;
}

uint64_t __52__SSRecommendedCarrierAppCell_sharedLockupViewGroup__block_invoke()
{
  sharedLockupViewGroup_group = [objc_alloc(MEMORY[0x263F25388]) initWithName:@"SimSetupSupport"];
  return MEMORY[0x270F9A758]();
}

- (SSRecommendedCarrierAppCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)SSRecommendedCarrierAppCell;
  v4 = [(SSRecommendedCarrierAppCell *)&v18 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(SSRecommendedCarrierAppCell *)v4 setBackgroundView:0];
    v6 = [MEMORY[0x263F825C8] clearColor];
    [(SSRecommendedCarrierAppCell *)v5 setBackgroundColor:v6];

    id v7 = objc_alloc(MEMORY[0x263F25380]);
    v8 = [(SSRecommendedCarrierAppCell *)v5 contentView];
    [v8 bounds];
    v9 = objc_msgSend(v7, "initWithFrame:");

    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(id)objc_opt_class() sharedLockupViewGroup];
    [v9 setGroup:v10];

    v11 = [(SSRecommendedCarrierAppCell *)v5 contentView];
    [v11 addSubview:v9];

    [(SSRecommendedCarrierAppCell *)v5 setLockupView:v9];
    v12 = (void *)MEMORY[0x263F08938];
    v13 = [(SSRecommendedCarrierAppCell *)v5 contentView];
    LODWORD(v14) = 1148846080;
    v15 = objc_msgSend(v9, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v13, 10.0, 16.0, 10.0, 16.0, v14);
    v16 = [v15 allConstraints];
    [v12 activateConstraints:v16];
  }
  return v5;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width = a3.width;
  v6 = [(SSRecommendedCarrierAppCell *)self lockupView];
  objc_msgSend(v6, "sizeThatFits:", width, 1.79769313e308);
  double v8 = v7;

  double v9 = v8 + 20.0;
  double v10 = width;
  result.height = v9;
  result.double width = v10;
  return result;
}

- (void)prepareForReuse
{
  request = self->_request;
  self->_request = 0;

  [(ASCLockupView *)self->_lockupView setRequest:0];
  v4 = [(SSRecommendedCarrierAppCell *)self _dummyLockup];
  [(ASCLockupView *)self->_lockupView setLockup:v4];

  [(ASCLockupView *)self->_lockupView setAutomaticallyPresentsProductDetails:0];
  v5.receiver = self;
  v5.super_class = (Class)SSRecommendedCarrierAppCell;
  [(SSRecommendedCarrierAppCell *)&v5 prepareForReuse];
}

- (void)setLockupRequest:(id)a3 withDelegate:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    id v9 = v7;
    objc_storeStrong((id *)&self->_request, a3);
    id v8 = a4;
    [(ASCLockupView *)self->_lockupView setRequest:self->_request];
    [(ASCLockupView *)self->_lockupView setAutomaticallyPresentsProductDetails:1];
    [(ASCLockupView *)self->_lockupView setDelegate:v8];

    id v7 = v9;
  }
}

- (id)_dummyLockup
{
  id v3 = objc_alloc(MEMORY[0x263F25370]);
  v4 = (void *)[objc_alloc(MEMORY[0x263F25350]) initWithInt64:0];
  uint64_t v5 = *MEMORY[0x263F25330];
  v6 = [(SSRecommendedCarrierAppCell *)self _dummyArtwork];
  id v7 = (void *)[v3 initWithID:v4 kind:v5 metrics:0 icon:v6 heading:0 title:0 subtitle:0 ageRating:0 offer:0];

  return v7;
}

- (id)_dummyArtwork
{
  id v2 = objc_alloc(MEMORY[0x263F25358]);
  id v3 = (void *)[v2 initWithURLTemplate:&stru_26DBE8E78 width:*MEMORY[0x263F252F0] height:*MEMORY[0x263F252E8] decoration:*MEMORY[0x263F252F8] preferredCrop:0.0 preferredFormat:0.0];
  return v3;
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end