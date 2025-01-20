@interface TUIAXAttributes
- (BOOL)axAdjustable;
- (BOOL)axButton;
- (BOOL)axDisabled;
- (BOOL)axHasNonDefaultAttributess;
- (BOOL)axHeading;
- (BOOL)axImage;
- (BOOL)axStaticText;
- (BOOL)axToggle;
- (BOOL)axTouchContainer;
- (BOOL)isAXElement;
- (NSString)axHint;
- (NSString)axIdentifier;
- (NSString)axLabel;
- (NSString)axValue;
- (TUIAXAttributes)initWithAXAttributes:(id)a3;
@end

@implementation TUIAXAttributes

- (TUIAXAttributes)initWithAXAttributes:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TUIAXAttributes;
  v5 = [(TUIAXAttributes *)&v27 init];
  if (v5)
  {
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFFFE | (unsigned __int16)[v4 axDisabled];
    if ([v4 isAXElement]) {
      __int16 v6 = 2;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFFFD | v6;
    if ([v4 axTouchContainer]) {
      __int16 v7 = 4;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFFFB | v7;
    if ([v4 axButton]) {
      __int16 v8 = 8;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFFF7 | v8;
    if ([v4 axImage]) {
      __int16 v9 = 16;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFFEF | v9;
    if ([v4 axHeading]) {
      __int16 v10 = 32;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFFDF | v10;
    if ([v4 axAdjustable]) {
      __int16 v11 = 64;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFFBF | v11;
    if ([v4 axToggle]) {
      __int16 v12 = 128;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFF7F | v12;
    if ([v4 axStaticText]) {
      __int16 v13 = 256;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFEFF | v13;
    v14 = [v4 axIdentifier];
    v15 = (NSString *)[v14 copy];
    axIdentifier = v5->_axIdentifier;
    v5->_axIdentifier = v15;

    v17 = [v4 axLabel];
    v18 = (NSString *)[v17 copy];
    axLabel = v5->_axLabel;
    v5->_axLabel = v18;

    v20 = [v4 axValue];
    v21 = (NSString *)[v20 copy];
    axValue = v5->_axValue;
    v5->_axValue = v21;

    v23 = [v4 axHint];
    v24 = (NSString *)[v23 copy];
    axHint = v5->_axHint;
    v5->_axHint = v24;
  }
  return v5;
}

- (BOOL)axHasNonDefaultAttributess
{
  return 1;
}

- (BOOL)axDisabled
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)isAXElement
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)axTouchContainer
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (BOOL)axButton
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (BOOL)axImage
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)axHeading
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (BOOL)axAdjustable
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (BOOL)axToggle
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (BOOL)axStaticText
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (NSString)axIdentifier
{
  return self->_axIdentifier;
}

- (NSString)axLabel
{
  return self->_axLabel;
}

- (NSString)axValue
{
  return self->_axValue;
}

- (NSString)axHint
{
  return self->_axHint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axHint, 0);
  objc_storeStrong((id *)&self->_axValue, 0);
  objc_storeStrong((id *)&self->_axLabel, 0);

  objc_storeStrong((id *)&self->_axIdentifier, 0);
}

@end