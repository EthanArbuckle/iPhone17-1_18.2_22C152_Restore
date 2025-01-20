@interface OADTablePartStyle
+ (id)defaultStyle;
- (id)cellStyle;
- (id)description;
- (id)shallowCopy;
- (id)textStyle;
- (void)applyOverridesFrom:(id)a3;
- (void)setCellStyle:(id)a3;
- (void)setTextStyle:(id)a3;
@end

@implementation OADTablePartStyle

- (void)setCellStyle:(id)a3
{
}

- (void)setTextStyle:(id)a3
{
}

- (id)cellStyle
{
  return self->mCellStyle;
}

- (id)textStyle
{
  return self->mTextStyle;
}

+ (id)defaultStyle
{
  v2 = (void *)+[OADTablePartStyle defaultStyle]::defaultStyle;
  if (!+[OADTablePartStyle defaultStyle]::defaultStyle)
  {
    v3 = objc_alloc_init(OADTablePartStyle);
    v4 = (void *)+[OADTablePartStyle defaultStyle]::defaultStyle;
    +[OADTablePartStyle defaultStyle]::defaultStyle = (uint64_t)v3;

    v5 = (void *)+[OADTablePartStyle defaultStyle]::defaultStyle;
    v6 = +[OADTableTextStyle defaultStyle];
    [v5 setTextStyle:v6];

    v7 = (void *)+[OADTablePartStyle defaultStyle]::defaultStyle;
    v8 = +[OADTableCellStyle defaultStyle];
    [v7 setCellStyle:v8];

    v2 = (void *)+[OADTablePartStyle defaultStyle]::defaultStyle;
  }
  return v2;
}

- (id)shallowCopy
{
  v3 = objc_alloc_init(OADTablePartStyle);
  v4 = [(OADTablePartStyle *)self cellStyle];
  v5 = (void *)[v4 shallowCopy];

  [(OADTablePartStyle *)v3 setCellStyle:v5];
  v6 = [(OADTablePartStyle *)self textStyle];
  v7 = (void *)[v6 shallowCopy];

  [(OADTablePartStyle *)v3 setTextStyle:v7];
  return v3;
}

- (void)applyOverridesFrom:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    v4 = [(OADTablePartStyle *)self cellStyle];
    v5 = [v8 cellStyle];
    [v4 applyOverridesFrom:v5];

    v6 = [(OADTablePartStyle *)self textStyle];
    v7 = [v8 textStyle];
    [v6 applyOverridesFrom:v7];
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTablePartStyle;
  v2 = [(OADTablePartStyle *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCellStyle, 0);
  objc_storeStrong((id *)&self->mTextStyle, 0);
}

@end