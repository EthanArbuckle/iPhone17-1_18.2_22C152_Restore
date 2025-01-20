@interface _TUISmartGridLayoutConfiguration
- ($881BB7C90C7D0DFCC1492E3DC022A30F)columnSpacing;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)columnWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)rowSpacing;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedHeight;
- (BOOL)balanceSections;
- (BOOL)paginated;
- (BOOL)truncate;
- (NSDictionary)additionalConfiguration;
- (TUISmartGridBox)box;
- (TUISnap)widthSnap;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)gradientFraction;
- (UIEdgeInsets)gradientInsets;
- (_TUISmartGridLayoutConfiguration)initWithWidth:(double)a3 height:(double)a4 box:(id)a5;
- (double)height;
- (double)width;
- (unint64_t)columnMultiple;
- (unint64_t)columns;
- (unint64_t)maxColumns;
- (unint64_t)maxPages;
- (unint64_t)rows;
- (unint64_t)unsignedIntegerWithSpec:(id)a3;
- (unint64_t)verticalPlacement;
@end

@implementation _TUISmartGridLayoutConfiguration

- (_TUISmartGridLayoutConfiguration)initWithWidth:(double)a3 height:(double)a4 box:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_TUISmartGridLayoutConfiguration;
  v10 = [(_TUISmartGridLayoutConfiguration *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_width = a3;
    v10->_height = a4;
    objc_storeStrong((id *)&v10->_box, a5);
  }

  return v11;
}

- (UIEdgeInsets)contentInsets
{
  [(TUISmartGridBox *)self->_box insets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)gradientInsets
{
  [(TUISmartGridBox *)self->_box gradientInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)gradientFraction
{
  [(TUISmartGridBox *)self->_box gradientFraction];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)columnWidth
{
  return [(TUISmartGridBox *)self->_box columnWidth];
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)columnSpacing
{
  return [(TUISmartGridBox *)self->_box columnSpacing];
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)rowSpacing
{
  return [(TUISmartGridBox *)self->_box rowSpacing];
}

- (unint64_t)rows
{
  return [(TUISmartGridBox *)self->_box rows];
}

- (unint64_t)verticalPlacement
{
  return [(TUISmartGridBox *)self->_box verticalPlacement];
}

- (TUISnap)widthSnap
{
  return [(TUISmartGridBox *)self->_box widthSnap];
}

- (NSDictionary)additionalConfiguration
{
  return [(TUISmartGridBox *)self->_box configuration];
}

- (unint64_t)columns
{
  double v3 = [(TUISmartGridBox *)self->_box columns];
  unint64_t v4 = [(_TUISmartGridLayoutConfiguration *)self unsignedIntegerWithSpec:v3];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return v4;
  }
}

- (unint64_t)unsignedIntegerWithSpec:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    unint64_t v5 = (unint64_t)[v4 integerValue];
    goto LABEL_10;
  }
  uint64_t v6 = [(TUISmartGridBox *)self->_box widthSnap];
  if (!v6 || (v7 = (void *)v6, char v8 = objc_opt_respondsToSelector(), v7, (v8 & 1) == 0))
  {
LABEL_9:
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_10;
  }
  id v9 = [(TUISmartGridBox *)self->_box widthSnap];
  v10 = [v9 identifierForValue:self->_width];

  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    v12 = [v4 objectForKeyedSubscript:v10];
    objc_super v13 = TUIDynamicCast(v11, v12);

    if (!v13)
    {
      uint64_t v14 = objc_opt_class();
      v15 = [v4 objectForKeyedSubscript:@"*"];
      objc_super v13 = TUIDynamicCast(v14, v15);
    }
  }
  else
  {
    objc_super v13 = 0;
  }
  unint64_t v5 = (unint64_t)[v13 integerValue];

LABEL_10:
  return v5;
}

- (unint64_t)columnMultiple
{
  return [(TUISmartGridBox *)self->_box columnMultiple];
}

- (unint64_t)maxColumns
{
  return [(TUISmartGridBox *)self->_box maxColumns];
}

- (BOOL)paginated
{
  return [(TUISmartGridBox *)self->_box paginated];
}

- (unint64_t)maxPages
{
  return [(TUISmartGridBox *)self->_box maxPages];
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedHeight
{
  return [(TUIBox *)self->_box height];
}

- (BOOL)balanceSections
{
  return [(TUISmartGridBox *)self->_box balanceSections];
}

- (BOOL)truncate
{
  return [(TUISmartGridBox *)self->_box truncate];
}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

- (TUISmartGridBox)box
{
  return self->_box;
}

- (void).cxx_destruct
{
}

@end