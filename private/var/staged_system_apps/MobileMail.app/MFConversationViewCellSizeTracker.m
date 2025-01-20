@interface MFConversationViewCellSizeTracker
+ (id)log;
- (CGSize)displaySizeForCellWithItemID:(id)a3;
- (CGSize)intrinsicSizeForCellWithItemID:(id)a3;
- (MFConversationViewCellSizeTracker)init;
- (MFConversationViewCellSizeTrackerDelegate)delegate;
- (id)intrinsicSizesForCellsWithItemIDs:(id)a3;
- (void)resetAllCellSizes;
- (void)resetCellSizesForCellsWithItemIDs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIntrinsicSize:(CGSize)a3 forCellWithItemID:(id)a4;
@end

@implementation MFConversationViewCellSizeTracker

- (MFConversationViewCellSizeTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFConversationViewCellSizeTracker;
  v2 = [(MFConversationViewCellSizeTracker *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    intrinsicCellSizes = v2->_intrinsicCellSizes;
    v2->_intrinsicCellSizes = v3;
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100191110;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699AA0 != -1) {
    dispatch_once(&qword_100699AA0, block);
  }
  v2 = (void *)qword_100699A98;

  return v2;
}

- (CGSize)displaySizeForCellWithItemID:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained defaultCellSizeForTracker:self];
  double v7 = v6;
  double v9 = v8;
  id v10 = [WeakRetained conversationViewCellSizeTracker:self expansionStatusForMessageWithItemID:v4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v10 != (id)3)
  {
    if (v10 == (id)2)
    {
      [WeakRetained defaultSemiExpandedHeightForTracker:self];
      double v13 = v12;
      goto LABEL_11;
    }
    double v13 = v9;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_11;
    }
  }
  [(MFConversationViewCellSizeTracker *)self intrinsicSizeForCellWithItemID:v4];
  if (CGSizeZero.height == v15 && CGSizeZero.width == v14) {
    double v13 = v9;
  }
  else {
    double v13 = v15;
  }
LABEL_11:
  if ([WeakRetained isDisplayingSingleMessageForTracker:self])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([WeakRetained isQuickReplyForTracker:self])
      {
        [WeakRetained quickReplyHeightForTracker:self];
        double v18 = v13 + v17;
        double v19 = v9 - v17;
        if (v18 <= v9) {
          double v9 = v19;
        }
        else {
          double v9 = v13;
        }
      }
      else if (v13 >= v9)
      {
        double v9 = v13;
      }
      [WeakRetained initialScrollOffsetForTracker:self];
      if (v9 + v20 >= 0.0) {
        double v13 = v9 + v20;
      }
      else {
        double v13 = v9;
      }
    }
  }

  double v21 = v7;
  double v22 = v13;
  result.height = v22;
  result.width = v21;
  return result;
}

- (CGSize)intrinsicSizeForCellWithItemID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_intrinsicCellSizes objectForKey:a3];
  id v4 = v3;
  if (v3)
  {
    [v3 CGSizeValue];
    CGFloat width = v5;
    CGFloat height = v7;
  }
  else
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }

  double v9 = width;
  double v10 = height;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (id)intrinsicSizesForCellsWithItemIDs:(id)a3
{
  id v4 = a3;
  intrinsicCellSizes = self->_intrinsicCellSizes;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained defaultCellSizeForTracker:self];
  double v7 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:");
  double v8 = [(NSMutableDictionary *)intrinsicCellSizes objectsForKeys:v4 notFoundMarker:v7];

  return v8;
}

- (void)setIntrinsicSize:(CGSize)a3 forCellWithItemID:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a4;
  double v7 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", width, height);
  [(NSMutableDictionary *)self->_intrinsicCellSizes setObject:v7 forKey:v8];
}

- (void)resetAllCellSizes
{
}

- (void)resetCellSizesForCellsWithItemIDs:(id)a3
{
}

- (MFConversationViewCellSizeTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFConversationViewCellSizeTrackerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_intrinsicCellSizes, 0);
}

@end