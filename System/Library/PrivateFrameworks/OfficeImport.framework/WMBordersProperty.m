@interface WMBordersProperty
- (WMBordersProperty)init;
- (void)setBorder:(id)a3 location:(int)a4;
@end

@implementation WMBordersProperty

- (WMBordersProperty)init
{
  v3.receiver = self;
  v3.super_class = (Class)WMBordersProperty;
  return [(CMBordersProperty *)&v3 init];
}

- (void)setBorder:(id)a3 location:(int)a4
{
  id v19 = a3;
  int v6 = [v19 style];
  int v7 = 4;
  switch(v6)
  {
    case 0:
      self->super.mBorderStyle[a4] = 0;
      goto LABEL_26;
    case 1:
    case 2:
    case 4:
    case 5:
      goto LABEL_5;
    case 3:
      int v7 = 2;
      goto LABEL_7;
    case 6:
      goto LABEL_7;
    case 7:
      goto LABEL_4;
    default:
      if (v6 == 22) {
LABEL_4:
      }
        int v7 = 3;
      else {
LABEL_5:
      }
        int v7 = 1;
LABEL_7:
      self->super.mBorderStyle[a4] = v7;
      unsigned int v8 = [v19 width];
      if (self->super.mBorderStyle[a4] == 2) {
        goto LABEL_8;
      }
      double v11 = (double)v8 / 20.0;
      if (v11 < 1.5)
      {
        mBorderWidth = self->super.mBorderWidth;
        int v10 = 1;
        goto LABEL_11;
      }
      if (v11 < 2.5)
      {
LABEL_8:
        mBorderWidth = self->super.mBorderWidth;
        int v10 = 2;
LABEL_11:
        mBorderWidth[a4] = v10;
        goto LABEL_12;
      }
      mBorderWidth = self->super.mBorderWidth;
      if (v11 < 3.5)
      {
        int v10 = 3;
        goto LABEL_11;
      }
      mBorderWidth[a4] = 4;
      self->super.mBorderWidth[a4 + 6] = (int)v11;
LABEL_12:
      if (!self->super.mBorderColor)
      {
        v12 = [v19 color];
        int v13 = [v12 isBlack];

        if (v13)
        {
          v14 = +[OITSUColor blackColor];
LABEL_15:
          mBorderColor = self->super.mBorderColor;
          self->super.mBorderColor = v14;
        }
        else
        {
          switch(a4)
          {
            case 1:
              v16 = [v19 color];
              uint64_t v17 = 24;
              break;
            case 2:
              v16 = [v19 color];
              uint64_t v17 = 32;
              break;
            case 3:
              v16 = [v19 color];
              uint64_t v17 = 40;
              break;
            case 4:
              v16 = [v19 color];
              uint64_t v17 = 48;
              break;
            default:
              v14 = [v19 color];
              goto LABEL_15;
          }
          v18 = *(Class *)((char *)&self->super.super.super.isa + v17);
          *(Class *)((char *)&self->super.super.super.isa + v17) = v16;
        }
      }
LABEL_26:

      return;
  }
}

@end