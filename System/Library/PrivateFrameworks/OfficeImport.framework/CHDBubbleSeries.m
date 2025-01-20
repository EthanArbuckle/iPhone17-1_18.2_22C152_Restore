@interface CHDBubbleSeries
- (BOOL)isBubble3D;
- (BOOL)isInvertIfNegative;
- (BOOL)isShowBubbleSize;
- (id)sizeData;
- (void)setBubble3D:(BOOL)a3;
- (void)setCategoryData:(id)a3;
- (void)setInvertIfNegative:(BOOL)a3;
- (void)setShowBubbleSize:(BOOL)a3;
- (void)setSizeData:(id)a3;
@end

@implementation CHDBubbleSeries

- (id)sizeData
{
  return self->mSizeData;
}

- (void)setSizeData:(id)a3
{
  v5 = (CHDData *)a3;
  if (self->mSizeData != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->mSizeData, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.mChart);
    v7 = [WeakRetained processors];
    [v7 markObject:v8 processor:objc_opt_class()];

    v5 = v8;
  }
}

- (BOOL)isBubble3D
{
  return self->mBubble3D;
}

- (void)setBubble3D:(BOOL)a3
{
  self->mBubble3D = a3;
}

- (BOOL)isInvertIfNegative
{
  return self->mInvertIfNegative;
}

- (void)setInvertIfNegative:(BOOL)a3
{
  self->mInvertIfNegative = a3;
}

- (BOOL)isShowBubbleSize
{
  return self->mShowBubbleSize;
}

- (void)setShowBubbleSize:(BOOL)a3
{
  self->mShowBubbleSize = a3;
}

- (void)setCategoryData:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CHDBubbleSeries;
  [(CHDSeries *)&v7 setCategoryData:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mChart);
  v6 = [WeakRetained processors];
  [v6 markObject:v4 processor:objc_opt_class()];
}

- (void).cxx_destruct
{
}

@end