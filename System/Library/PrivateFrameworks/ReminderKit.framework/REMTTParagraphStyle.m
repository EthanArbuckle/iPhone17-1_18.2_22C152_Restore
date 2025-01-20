@interface REMTTParagraphStyle
- (REMTTParagraphStyle)initWithContents:(id)a3;
- (REMTTParagraphStyle)initWithStyle:(int64_t)a3;
- (TTParagraphStyle)innerStyle;
- (id)listBulletInAttributedString:(id)a3 atIndex:(unint64_t)a4;
- (int64_t)remParagraphStyle;
- (void)setInnerStyle:(id)a3;
@end

@implementation REMTTParagraphStyle

- (REMTTParagraphStyle)initWithContents:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMTTParagraphStyle;
  v5 = [(REMTTParagraphStyle *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = REMDynamicCast(v6, (uint64_t)v4);
    if (!v7)
    {
      v9 = 0;
      goto LABEL_6;
    }
    innerStyle = v5->_innerStyle;
    v5->_innerStyle = (TTParagraphStyle *)v7;
  }
  v9 = v5;
LABEL_6:

  return v9;
}

- (REMTTParagraphStyle)initWithStyle:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)REMTTParagraphStyle;
  id v4 = [(REMTTParagraphStyle *)&v9 init];
  if (v4)
  {
    switch(a3)
    {
      case 1:
        uint64_t v6 = 100;
        goto LABEL_7;
      case 2:
        uint64_t v6 = 101;
        goto LABEL_7;
      case 3:
        uint64_t v6 = 102;
LABEL_7:
        uint64_t v5 = +[TTParagraphStyle paragraphStyleNamed:v6];
        break;
      default:
        uint64_t v5 = +[TTParagraphStyle defaultParagraphStyle];
        break;
    }
    uint64_t v7 = (void *)v5;
    [(REMTTParagraphStyle *)v4 setInnerStyle:v5];
  }
  return v4;
}

- (int64_t)remParagraphStyle
{
  v2 = [(REMTTParagraphStyle *)self innerStyle];
  int v3 = [v2 style];

  uint64_t v4 = (v3 - 100);
  if (v4 < 3) {
    return v4 + 1;
  }
  else {
    return 0;
  }
}

- (id)listBulletInAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(REMTTParagraphStyle *)self innerStyle];
  v8 = [v7 listBulletInAttributedString:v6 atIndex:a4];

  return v8;
}

- (TTParagraphStyle)innerStyle
{
  return self->_innerStyle;
}

- (void)setInnerStyle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end