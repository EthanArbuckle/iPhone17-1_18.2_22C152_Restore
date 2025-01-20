@interface SXDataTableTextSource
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)indexPath;
- (SXDataTableTextSource)initWithFormattedText:(id)a3 indexPath:(id)a4 smartFieldFactory:(id)a5 dataSource:(id)a6 documentLangaugeProvider:(id)a7 fontAttributesConstructor:(id)a8;
- (SXFormattedText)formattedText;
- (unint64_t)defaultTextAlignment;
- (void)applyStylingOnTextTangierStorage:(id)a3;
- (void)setDefaultTextAlignment:(unint64_t)a3;
@end

@implementation SXDataTableTextSource

- (SXDataTableTextSource)initWithFormattedText:(id)a3 indexPath:(id)a4 smartFieldFactory:(id)a5 dataSource:(id)a6 documentLangaugeProvider:(id)a7 fontAttributesConstructor:(id)a8
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  id v14 = a3;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  v19 = [v14 text];
  v23.receiver = self;
  v23.super_class = (Class)SXDataTableTextSource;
  v20 = [(SXTextSource *)&v23 initWithString:v19 smartFieldFactory:v18 dataSource:v17 documentLanguageProvider:v16 fontAttributesConstructor:v15];

  if (v20)
  {
    objc_storeStrong((id *)&v20->_formattedText, a3);
    v20->_indexPath.rowIndex = var0;
    v20->_indexPath.columnIndex = var1;
  }

  return v20;
}

- (void)applyStylingOnTextTangierStorage:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXDataTableTextSource;
  [(SXTextSource *)&v10 applyStylingOnTextTangierStorage:v4];
  v5 = [(SXTextSource *)self dataSource];
  v6 = [v5 componentTextStyleForTextSource:self inheritingFromDefaultStyles:1];

  if (-[SXDataTableTextSource defaultTextAlignment](self, "defaultTextAlignment") && ![v6 textAlignment])
  {
    unint64_t v7 = [(SXDataTableTextSource *)self defaultTextAlignment];
    if (v7 == 3) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2 * (v7 == 2);
    }
    v9 = [v4 paragraphStyleAtParIndex:0 effectiveRange:0];
    [v9 setIntValue:v8 forProperty:86];
  }
}

- (SXFormattedText)formattedText
{
  return self->_formattedText;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)indexPath
{
  p_indexPath = &self->_indexPath;
  unint64_t rowIndex = self->_indexPath.rowIndex;
  unint64_t columnIndex = p_indexPath->columnIndex;
  result.unint64_t var1 = columnIndex;
  result.unint64_t var0 = rowIndex;
  return result;
}

- (unint64_t)defaultTextAlignment
{
  return self->_defaultTextAlignment;
}

- (void)setDefaultTextAlignment:(unint64_t)a3
{
  self->_defaultTextAlignment = a3;
}

- (void).cxx_destruct
{
}

@end