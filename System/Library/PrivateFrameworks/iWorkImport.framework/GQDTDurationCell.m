@interface GQDTDurationCell
- (__CFString)createStringValue;
- (int)readAttributesForDurationCell:(_xmlTextReader *)a3;
- (void)dealloc;
- (void)setProcessorBundle:(__CFBundle *)a3;
@end

@implementation GQDTDurationCell

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDTDurationCell;
  [(GQDTCell *)&v3 dealloc];
}

- (__CFString)createStringValue
{
  mComputedFormat = self->mComputedFormat;
  if (!mComputedFormat || ![(GQDTComputedFormatSpec *)mComputedFormat isDurationFormat])
  {
    v4 = [(GQDSStyle *)self->super.mStyle valueForObjectProperty:124];
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v4 = [(GQDTComputedFormatSpec *)self->mComputedFormat format];
  if (v4) {
LABEL_6:
  }
    v4 = (__CFString *)[(__CFString *)v4 formatString];
LABEL_7:
  if (!v4) {
    v4 = @"hhh mmm sss";
  }
  double mValue = self->mValue;
  mProcessorBundle = self->mProcessorBundle;
  return sub_4E784(v4, mProcessorBundle, mValue);
}

- (int)readAttributesForDurationCell:(_xmlTextReader *)a3
{
  sub_433CC(a3, qword_A35E8, (xmlChar *)"du");
  self->double mValue = v4;
  return 1;
}

- (void)setProcessorBundle:(__CFBundle *)a3
{
  self->mProcessorBundle = a3;
}

@end