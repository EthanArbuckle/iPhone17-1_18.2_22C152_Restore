@interface MessageStatusIndicatorManager
+ (id)dotIndicatorImage;
+ (id)flagShapeImage;
+ (id)statusIndicatorColorWithOptions:(unint64_t)a3;
+ (id)statusIndicatorColorWithOptions:(unint64_t)a3 flagColors:(id)a4 useSelectedColors:(BOOL)a5;
+ (id)timeSensitivePromotionsImage;
+ (id)timeSensitiveTransactionsImage;
+ (id)timeSensitiveUpdatesImage;
+ (void)clearCache;
- (BOOL)_indicatorOptionsAreDisabled:(unint64_t)a3;
- (BOOL)hidesAttachmentIndicator;
- (BOOL)hidesUnreadIndicator;
- (BOOL)hidesVIPIndicator;
- (BOOL)useSelectedColors;
- (NSIndexSet)flagColors;
- (double)midXToMidXSpacing;
- (id)statusIndicatorColorWithOptionsMask:(unint64_t)a3;
- (id)statusIndicatorImageWithOptionsMask:(unint64_t)a3;
- (unint64_t)effectiveIndicatorOptions;
- (unint64_t)indicatorOptions;
- (void)_setIndicatorOptions:(unint64_t)a3 disabled:(BOOL)a4;
- (void)pruneIndicatorOptions:(int64_t)a3;
- (void)setFlagColors:(id)a3;
- (void)setHidesAttachmentIndicator:(BOOL)a3;
- (void)setHidesUnreadIndicator:(BOOL)a3;
- (void)setHidesVIPIndicator:(BOOL)a3;
- (void)setIndicatorOptions:(unint64_t)a3;
- (void)setUseSelectedColors:(BOOL)a3;
@end

@implementation MessageStatusIndicatorManager

+ (id)dotIndicatorImage
{
  return +[UIImage mf_systemImageNamed:MFImageGlyphStatusIndicatorUnread forView:11];
}

+ (id)flagShapeImage
{
  return +[UIImage mf_systemImageNamed:MFImageGlyphStatusIndicatorFlagged forView:12];
}

+ (id)timeSensitiveTransactionsImage
{
  return +[UIImage mf_systemImageNamed:MFImageGlyphCategoryTransactionsTimeSensitive forView:12];
}

+ (id)timeSensitivePromotionsImage
{
  return +[UIImage mf_systemImageNamed:MFImageGlyphCategoryPromotionsTimeSensitive forView:12];
}

+ (id)timeSensitiveUpdatesImage
{
  return +[UIImage mf_systemImageNamed:MFImageGlyphCategoryUpdatesTimeSensitive forView:12];
}

- (id)statusIndicatorColorWithOptionsMask:(unint64_t)a3
{
  unint64_t v5 = [(MessageStatusIndicatorManager *)self effectiveIndicatorOptions];
  v6 = [(MessageStatusIndicatorManager *)self flagColors];
  v7 = +[MessageStatusIndicatorManager statusIndicatorColorWithOptions:v5 & a3 flagColors:v6 useSelectedColors:[(MessageStatusIndicatorManager *)self useSelectedColors]];

  return v7;
}

+ (id)statusIndicatorColorWithOptions:(unint64_t)a3
{
  return [a1 statusIndicatorColorWithOptions:a3 flagColors:0 useSelectedColors:0];
}

+ (id)statusIndicatorColorWithOptions:(unint64_t)a3 flagColors:(id)a4 useSelectedColors:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  if (v5) {
    +[UIColor systemWhiteColor];
  }
  else {
  v8 = +[UIColor systemBlueColor];
  }
  if ((uint64_t)a3 > 127)
  {
    if ((uint64_t)a3 > 1023)
    {
      switch(a3)
      {
        case 0x400uLL:
          uint64_t v9 = +[UIColor systemGreenColor];
          break;
        case 0x800uLL:
          uint64_t v9 = +[UIColor systemPinkColor];
          break;
        case 0x1000uLL:
          uint64_t v9 = +[UIColor systemIndigoColor];
          break;
        default:
          goto LABEL_35;
      }
      goto LABEL_34;
    }
    if (a3 != 128)
    {
      if (a3 == 256)
      {
        uint64_t v9 = +[UIColor systemRedColor];
LABEL_34:
        v11 = (void *)v9;

        v8 = v11;
        goto LABEL_35;
      }
      if (a3 != 512) {
        goto LABEL_35;
      }
    }
LABEL_18:
    if (v5) {
      +[UIColor mailMessageListSelectedStatusIndicatorColor];
    }
    else {
      +[UIColor tertiaryLabelColor];
    }
    uint64_t v9 = LABEL_17:;
    goto LABEL_34;
  }
  if (a3 <= 0x7F)
  {
    switch(a3)
    {
      case 1uLL:
        if (v5) {
          +[UIColor systemWhiteColor];
        }
        else {
          +[UIColor systemBlueColor];
        }
        goto LABEL_17;
      case 2uLL:
        uint64_t v9 = +[UIColor systemYellowColor];
        goto LABEL_34;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        goto LABEL_35;
      case 4uLL:
        if ([v7 count]) {
          id v10 = [v7 firstIndex];
        }
        else {
          id v10 = 0;
        }
        uint64_t v9 = +[UIColor mf_colorFromFlagColor:v10];
        goto LABEL_34;
      case 8uLL:
        goto LABEL_18;
      default:
        JUMPOUT(0);
    }
  }
  if (a3 - 16 <= 0x30 && ((1 << (a3 - 16)) & 0x1000000010101) != 0) {
    goto LABEL_18;
  }
LABEL_35:

  return v8;
}

+ (void)clearCache
{
  qword_100048580 = 0;
}

- (double)midXToMidXSpacing
{
  double result = *(double *)&qword_100048580;
  double v3 = -*(double *)&qword_100048580;
  if (*(double *)&qword_100048580 >= 0.0) {
    double v3 = *(double *)&qword_100048580;
  }
  if (v3 < 2.22044605e-16)
  {
    v4 = +[MessageStatusIndicatorManager flagShapeImage];
    [v4 size];
    *(double *)&qword_100048580 = v5 * 1.5;

    return *(double *)&qword_100048580;
  }
  return result;
}

- (void)pruneIndicatorOptions:(int64_t)a3
{
  self->_pruneDisabledIndicatorOptions = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006EFC;
  v4[3] = &unk_10003C9C0;
  v4[4] = self;
  v4[5] = v5;
  v4[6] = a3;
  double v3 = objc_retainBlock(v4);
  ((void (*)(void *, uint64_t))v3[2])(v3, 1);
  ((void (*)(void *, uint64_t))v3[2])(v3, 4);
  ((void (*)(void *, uint64_t))v3[2])(v3, 32);
  ((void (*)(void *, uint64_t))v3[2])(v3, 8);
  ((void (*)(void *, uint64_t))v3[2])(v3, 16);
  ((void (*)(void *, uint64_t))v3[2])(v3, 64);
  ((void (*)(void *, uint64_t))v3[2])(v3, 512);
  ((void (*)(void *, uint64_t))v3[2])(v3, 128);
  ((void (*)(void *, uint64_t))v3[2])(v3, 256);

  _Block_object_dispose(v5, 8);
}

- (void)setHidesUnreadIndicator:(BOOL)a3
{
}

- (BOOL)hidesUnreadIndicator
{
  return [(MessageStatusIndicatorManager *)self _indicatorOptionsAreDisabled:1];
}

- (void)setHidesVIPIndicator:(BOOL)a3
{
}

- (BOOL)hidesVIPIndicator
{
  return [(MessageStatusIndicatorManager *)self _indicatorOptionsAreDisabled:2];
}

- (void)setHidesAttachmentIndicator:(BOOL)a3
{
}

- (BOOL)hidesAttachmentIndicator
{
  return [(MessageStatusIndicatorManager *)self _indicatorOptionsAreDisabled:32];
}

- (unint64_t)effectiveIndicatorOptions
{
  return [(MessageStatusIndicatorManager *)self indicatorOptions] & ~(self->_pruneDisabledIndicatorOptions | self->_disabledIndicatorOptions);
}

- (id)statusIndicatorImageWithOptionsMask:(unint64_t)a3
{
  int64_t v3 = [(MessageStatusIndicatorManager *)self effectiveIndicatorOptions] & a3;
  if (v3 <= 31)
  {
    double v5 = 0;
    v4 = &MFImageGlyphStatusIndicatorVIP;
    switch(v3)
    {
      case 0:
        goto LABEL_33;
      case 1:
        double v5 = +[MessageStatusIndicatorManager dotIndicatorImage];
        goto LABEL_29;
      case 2:
        goto LABEL_28;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_30;
      case 4:
        double v5 = +[MessageStatusIndicatorManager flagShapeImage];
        goto LABEL_29;
      case 8:
        goto LABEL_15;
      default:
        if (v3 == 16)
        {
          v4 = &MFImageGlyphStatusIndicatorForwarded;
        }
        else
        {
          if (v3 != 24) {
            goto LABEL_30;
          }
LABEL_15:
          v4 = &MFImageGlyphStatusIndicatorReplied;
        }
        break;
    }
    goto LABEL_28;
  }
  if (v3 > 511)
  {
    if (v3 > 2047)
    {
      if (v3 == 2048)
      {
        double v5 = +[MessageStatusIndicatorManager timeSensitivePromotionsImage];
        goto LABEL_29;
      }
      if (v3 == 4096)
      {
        double v5 = +[MessageStatusIndicatorManager timeSensitiveUpdatesImage];
        goto LABEL_29;
      }
    }
    else
    {
      if (v3 == 512)
      {
        v4 = &MFImageGlyphStatusIndicatorReadLater;
        goto LABEL_28;
      }
      if (v3 == 1024)
      {
        double v5 = +[MessageStatusIndicatorManager timeSensitiveTransactionsImage];
        goto LABEL_29;
      }
    }
  }
  else if (v3 > 127)
  {
    if (v3 == 128)
    {
      v4 = &MFImageGlyphStatusIndicatorMute;
      goto LABEL_28;
    }
    if (v3 == 256)
    {
      v4 = &MFImageGlyphStatusIndicatorBlockSender;
      goto LABEL_28;
    }
  }
  else
  {
    if (v3 == 32)
    {
      v4 = &MFImageGlyphStatusIndicatorAttachment;
      goto LABEL_28;
    }
    if (v3 == 64)
    {
      v4 = &MFImageGlyphStatusIndicatorNotify;
LABEL_28:
      double v5 = +[UIImage mf_systemImageNamed:*v4 forView:12];
LABEL_29:
      if (v5) {
        goto LABEL_33;
      }
    }
  }
LABEL_30:
  v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "UIImage *ImageForOptions(MessageStatusIndicatorOptions)";
    __int16 v10 = 2048;
    int64_t v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Warning %s: No image pair for options %lu", (uint8_t *)&v8, 0x16u);
  }

  double v5 = 0;
LABEL_33:

  return v5;
}

- (void)_setIndicatorOptions:(unint64_t)a3 disabled:(BOOL)a4
{
  if (a4) {
    unint64_t v4 = self->_disabledIndicatorOptions | a3;
  }
  else {
    unint64_t v4 = self->_disabledIndicatorOptions & ~a3;
  }
  self->_disabledIndicatorOptions = v4;
}

- (BOOL)_indicatorOptionsAreDisabled:(unint64_t)a3
{
  return (a3 & ~self->_disabledIndicatorOptions) == 0;
}

- (BOOL)useSelectedColors
{
  return self->_useSelectedColors;
}

- (void)setUseSelectedColors:(BOOL)a3
{
  self->_useSelectedColors = a3;
}

- (NSIndexSet)flagColors
{
  return self->_flagColors;
}

- (void)setFlagColors:(id)a3
{
}

- (unint64_t)indicatorOptions
{
  return self->_indicatorOptions;
}

- (void)setIndicatorOptions:(unint64_t)a3
{
  self->_indicatorOptions = a3;
}

- (void).cxx_destruct
{
}

@end