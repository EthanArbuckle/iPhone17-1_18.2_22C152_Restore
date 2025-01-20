@interface IPAAdjustmentEnvelope
- (BOOL)containsPhotoAdjustments;
- (BOOL)containsVideoAdjustments;
- (IPAAdjustmentStack)adjustmentStack;
- (NSString)format;
- (NSString)formatVersion;
- (NSString)originator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)setAdjustmentStack:(id)a3;
- (void)setFormat:(id)a3;
- (void)setFormatVersion:(id)a3;
- (void)setOriginator:(id)a3;
@end

@implementation IPAAdjustmentEnvelope

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_adjustmentStack, 0);
}

- (void)setFormatVersion:(id)a3
{
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (void)setFormat:(id)a3
{
}

- (NSString)format
{
  return self->_format;
}

- (void)setOriginator:(id)a3
{
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setAdjustmentStack:(id)a3
{
}

- (IPAAdjustmentStack)adjustmentStack
{
  return self->_adjustmentStack;
}

- (id)debugDescription
{
  v3 = NSString;
  long long v9 = *(_OWORD *)&self->_originator;
  formatVersion = self->_formatVersion;
  adjustmentStack = self->_adjustmentStack;
  v6 = [(IPAAdjustmentStack *)adjustmentStack adjustments];
  v7 = [v3 stringWithFormat:@"<IPAAdjEnv:%p originator=%@ format=%@ formatVersion=%@ adjustments(%p).count=%lu>", self, v9, formatVersion, adjustmentStack, objc_msgSend(v6, "count")];

  return v7;
}

- (BOOL)containsVideoAdjustments
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)containsPhotoAdjustments
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_adjustmentStack);
    objc_storeStrong(v5 + 2, self->_originator);
    objc_storeStrong(v5 + 3, self->_format);
    objc_storeStrong(v5 + 4, self->_formatVersion);
  }
  return v5;
}

@end