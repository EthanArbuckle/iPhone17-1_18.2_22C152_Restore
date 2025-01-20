@interface PXStoryTVWatchNextCellConfiguration
- (BOOL)isEqual:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (PXStoryTVCellSpec)spec;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)countdownValue;
- (int64_t)maximumCountdownValue;
- (unint64_t)hash;
- (void)setCountdownValue:(int64_t)a3;
- (void)setMaximumCountdownValue:(int64_t)a3;
- (void)setSpec:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXStoryTVWatchNextCellConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (void)setMaximumCountdownValue:(int64_t)a3
{
  self->_maximumCountdownValue = a3;
}

- (int64_t)maximumCountdownValue
{
  return self->_maximumCountdownValue;
}

- (void)setCountdownValue:(int64_t)a3
{
  self->_countdownValue = a3;
}

- (int64_t)countdownValue
{
  return self->_countdownValue;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setSpec:(id)a3
{
}

- (PXStoryTVCellSpec)spec
{
  return self->_spec;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXStoryTVWatchNextCellConfiguration *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v18.receiver = self;
      v18.super_class = (Class)PXStoryTVWatchNextCellConfiguration;
      if (![(PXGFocusEffectViewConfiguration *)&v18 isEqual:v5])
      {
        BOOL v9 = 0;
LABEL_23:

        goto LABEL_24;
      }
      id v6 = [(PXStoryTVWatchNextCellConfiguration *)self title];
      id v7 = [(PXStoryTVWatchNextCellConfiguration *)v5 title];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqualToString:v7];

        if (!v8)
        {
          BOOL v9 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      id v10 = [(PXStoryTVWatchNextCellConfiguration *)self subtitle];
      id v11 = [(PXStoryTVWatchNextCellConfiguration *)v5 subtitle];
      if (v10 == v11)
      {
      }
      else
      {
        int v12 = [v10 isEqualToString:v11];

        if (!v12)
        {
          BOOL v9 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      id v13 = [(PXStoryTVWatchNextCellConfiguration *)self spec];
      id v14 = [(PXStoryTVWatchNextCellConfiguration *)v5 spec];
      if (v13 == v14)
      {
      }
      else
      {
        int v15 = [v13 isEqual:v14];

        if (!v15)
        {
          BOOL v9 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      int64_t v16 = [(PXStoryTVWatchNextCellConfiguration *)self countdownValue];
      BOOL v9 = v16 == [(PXStoryTVWatchNextCellConfiguration *)v5 countdownValue];
      goto LABEL_20;
    }
    BOOL v9 = 0;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryTVWatchNextCellConfiguration;
  unint64_t v3 = [(PXGFocusEffectViewConfiguration *)&v7 hash];
  NSUInteger v4 = v3 ^ (2 * [(NSString *)self->_title hash]);
  NSUInteger v5 = v4 ^ (4 * [(NSString *)self->_subtitle hash]);
  return v5 ^ (8 * [(PXStoryTVCellSpec *)self->_spec hash]) ^ (16 * self->_countdownValue);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  NSUInteger v5 = [(PXGFocusableViewConfiguration *)self delegate];
  [v4 setDelegate:v5];

  [(PXGFocusEffectViewConfiguration *)self cornerRadius];
  objc_msgSend(v4, "setCornerRadius:");
  [(PXGFocusEffectViewConfiguration *)self contentMotionRotation];
  objc_msgSend(v4, "setContentMotionRotation:");
  [(PXGFocusEffectViewConfiguration *)self contentMotionTranslation];
  objc_msgSend(v4, "setContentMotionTranslation:");
  [(PXGFocusEffectViewConfiguration *)self focusedSizeIncrease];
  objc_msgSend(v4, "setFocusedSizeIncrease:");
  uint64_t v6 = [(NSString *)self->_title copy];
  id v7 = v4[13];
  v4[13] = (id)v6;

  uint64_t v8 = [(NSString *)self->_subtitle copy];
  id v9 = v4[14];
  v4[14] = (id)v8;

  objc_storeStrong(v4 + 12, self->_spec);
  v4[15] = self->_countdownValue;
  return v4;
}

@end