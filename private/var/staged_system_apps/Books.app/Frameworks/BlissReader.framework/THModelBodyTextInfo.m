@interface THModelBodyTextInfo
- (BOOL)autosizes;
- (Class)layoutClass;
- (Class)repClass;
- (THWPStorage)bodyStorage;
- (TSWPColumnStyle)columnStyle;
- (TSWPLineHintCollection)lineHints;
- (void)dealloc;
- (void)setAutosizes:(BOOL)a3;
- (void)setColumnStyle:(id)a3;
- (void)setLineHints:(id)a3;
@end

@implementation THModelBodyTextInfo

- (BOOL)autosizes
{
  return self->mAutosizes;
}

- (void)setAutosizes:(BOOL)a3
{
  self->mAutosizes = a3;
}

- (TSWPColumnStyle)columnStyle
{
  return self->mColumnStyle;
}

- (void)setColumnStyle:(id)a3
{
  [(THModelBodyTextInfo *)self willModify];
  id v5 = a3;

  self->mColumnStyle = (TSWPColumnStyle *)a3;
}

- (TSWPLineHintCollection)lineHints
{
  return self->mLineHints;
}

- (void)setLineHints:(id)a3
{
  [(THModelBodyTextInfo *)self willModify];
  id v5 = a3;

  self->mLineHints = (TSWPLineHintCollection *)a3;
}

- (THWPStorage)bodyStorage
{
  id v2 = [(THModelBodyTextInfo *)self parentInfo];

  return (THWPStorage *)[v2 bodyStorage];
}

- (void)dealloc
{
  self->mColumnStyle = 0;
  self->mLineHints = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelBodyTextInfo;
  [(THModelBodyTextInfo *)&v3 dealloc];
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

@end