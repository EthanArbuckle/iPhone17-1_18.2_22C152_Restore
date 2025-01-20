@interface _PXStoryScrubberClipViewConfiguration
- (BOOL)isCurrent;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAdjustContent;
- (_PXStoryScrubberClipViewConfiguration)initWithConfiguration:(id)a3;
- (int64_t)segmentIdentifier;
- (unint64_t)hash;
- (void)setIsCurrent:(BOOL)a3;
- (void)setSegmentIdentifier:(int64_t)a3;
- (void)setShouldAdjustContent:(BOOL)a3;
@end

@implementation _PXStoryScrubberClipViewConfiguration

- (void)setShouldAdjustContent:(BOOL)a3
{
  self->_shouldAdjustContent = a3;
}

- (BOOL)shouldAdjustContent
{
  return self->_shouldAdjustContent;
}

- (void)setIsCurrent:(BOOL)a3
{
  self->_isCurrent = a3;
}

- (BOOL)isCurrent
{
  return self->_isCurrent;
}

- (void)setSegmentIdentifier:(int64_t)a3
{
  self->_segmentIdentifier = a3;
}

- (int64_t)segmentIdentifier
{
  return self->_segmentIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_PXStoryScrubberClipViewConfiguration *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v11.receiver = self;
      v11.super_class = (Class)_PXStoryScrubberClipViewConfiguration;
      if ([(PXGFocusEffectViewConfiguration *)&v11 isEqual:v5]
        && (BOOL v6 = [(_PXStoryScrubberClipViewConfiguration *)self isCurrent],
            v6 == [(_PXStoryScrubberClipViewConfiguration *)v5 isCurrent])
        && (BOOL v7 = [(_PXStoryScrubberClipViewConfiguration *)self shouldAdjustContent],
            v7 == [(_PXStoryScrubberClipViewConfiguration *)v5 shouldAdjustContent]))
      {
        int64_t v10 = [(_PXStoryScrubberClipViewConfiguration *)self segmentIdentifier];
        BOOL v8 = v10 == [(_PXStoryScrubberClipViewConfiguration *)v5 segmentIdentifier];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_PXStoryScrubberClipViewConfiguration;
  return [(PXGFocusEffectViewConfiguration *)&v3 hash] ^ self->_isCurrent ^ (2 * self->_shouldAdjustContent) ^ (4 * self->_segmentIdentifier);
}

- (_PXStoryScrubberClipViewConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_PXStoryScrubberClipViewConfiguration;
  v5 = [(PXGFocusEffectViewConfiguration *)&v7 initWithConfiguration:v4];
  if (v5)
  {
    v5->_isCurrent = [v4 isCurrent];
    v5->_shouldAdjustContent = [v4 shouldAdjustContent];
    v5->_segmentIdentifier = [v4 segmentIdentifier];
  }

  return v5;
}

@end