@interface SKUIItemGridCollectionViewLayout
+ (Class)layoutAttributesClass;
- (SKUIItemGridCollectionViewLayout)init;
- (UIColor)evenRowBackgroundColor;
- (UIColor)oddRowBackgroundColor;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (int64_t)numberOfColumns;
- (void)init;
- (void)setEvenRowBackgroundColor:(id)a3;
- (void)setNumberOfColumns:(int64_t)a3;
- (void)setOddRowBackgroundColor:(id)a3;
@end

@implementation SKUIItemGridCollectionViewLayout

- (SKUIItemGridCollectionViewLayout)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIItemGridCollectionViewLayout init]();
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIItemGridCollectionViewLayout;
  v3 = [(UICollectionViewFlowLayout *)&v6 init];
  v4 = v3;
  if (v3)
  {
    [(UICollectionViewFlowLayout *)v3 setMinimumInteritemSpacing:0.0];
    [(UICollectionViewFlowLayout *)v4 setMinimumLineSpacing:0.0];
  }
  return v4;
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  v31.receiver = self;
  v31.super_class = (Class)SKUIItemGridCollectionViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v31, sel_layoutAttributesForElementsInRect_, x, y, width, height);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v14 = [v13 indexPath];
        uint64_t v15 = [v14 item];

        if ((v15 / self->_numberOfColumns)) {
          uint64_t v16 = 568;
        }
        else {
          uint64_t v16 = 552;
        }
        if (*(Class *)((char *)&self->super.super.super.isa + v16))
        {
          objc_msgSend(v13, "setBackgroundColor:");
        }
        else
        {
          v17 = [MEMORY[0x1E4FB1618] whiteColor];
          [v13 setBackgroundColor:v17];
        }
        int64_t numberOfColumns = self->_numberOfColumns;
        uint64_t v19 = 16;
        if (v15 < numberOfColumns) {
          uint64_t v19 = 8;
        }
        BOOL v20 = v15 % numberOfColumns == 0;
        BOOL v21 = v15 % numberOfColumns == numberOfColumns - 1;
        if (ShouldReverseLayoutDirection) {
          BOOL v22 = v21;
        }
        else {
          BOOL v22 = v20;
        }
        if (ShouldReverseLayoutDirection) {
          BOOL v21 = v20;
        }
        BOOL v23 = !v21;
        uint64_t v24 = 4;
        if (v23) {
          uint64_t v24 = 2;
        }
        if (v22) {
          uint64_t v24 = 1;
        }
        [v13 setPosition:v19 | v24];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  return obj;
}

- (UIColor)evenRowBackgroundColor
{
  return self->_evenColor;
}

- (void)setEvenRowBackgroundColor:(id)a3
{
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(int64_t)a3
{
  self->_int64_t numberOfColumns = a3;
}

- (UIColor)oddRowBackgroundColor
{
  return self->_oddColor;
}

- (void)setOddRowBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oddColor, 0);

  objc_storeStrong((id *)&self->_evenColor, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIItemGridCollectionViewLayout init]";
}

@end