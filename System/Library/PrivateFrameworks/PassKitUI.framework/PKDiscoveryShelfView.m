@interface PKDiscoveryShelfView
+ (id)viewForShelf:(id)a3 discoveryCardViewDelegate:(id)a4;
+ (id)viewForShelf:(id)a3 discoveryCardViewDelegate:(id)a4 itemIdentifier:(id)a5;
- (NSString)itemIdentifier;
- (PKDiscoveryShelfView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInsets;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setItemIdentifier:(id)a3;
@end

@implementation PKDiscoveryShelfView

+ (id)viewForShelf:(id)a3 discoveryCardViewDelegate:(id)a4 itemIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  switch([v7 type])
  {
    case 1:
      v10 = PKDiscoveryTextBlockShelfView;
      goto LABEL_9;
    case 2:
      id v12 = v7;
      v13 = [v12 media];
      uint64_t v14 = [v13 type];

      v15 = &off_1E59C3398;
      if (v14 != 2) {
        v15 = off_1E59C3388;
      }
      v11 = (PKDiscoveryCallToActionShelfView *)[objc_alloc(*v15) initWithShelf:v12];

      if (!v9) {
        break;
      }
      goto LABEL_12;
    case 3:
      v10 = PKDiscoverySpacerShelfView;
LABEL_9:
      v11 = (PKDiscoveryCallToActionShelfView *)[[v10 alloc] initWithShelf:v7];
      if (!v9) {
        break;
      }
      goto LABEL_12;
    case 4:
      v11 = [[PKDiscoveryCallToActionShelfView alloc] initWithShelf:v7];
      [(PKDiscoveryCallToActionShelfView *)v11 setDelegate:v8];
      if (v9)
      {
LABEL_12:
        if (v11) {
          [(PKDiscoveryShelfView *)v11 setItemIdentifier:v9];
        }
      }
      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

+ (id)viewForShelf:(id)a3 discoveryCardViewDelegate:(id)a4
{
  return (id)[a1 viewForShelf:a3 discoveryCardViewDelegate:a4 itemIdentifier:0];
}

- (PKDiscoveryShelfView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKDiscoveryShelfView;
  v3 = -[PKDiscoveryShelfView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(PKDiscoveryShelfView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end