@interface ShorteningLabel
- (NSArray)attributedTextAlternatives;
- (void)_updateAttributedText;
- (void)layoutSubviews;
- (void)setAttributedTextAlternatives:(id)a3;
- (void)setFont:(id)a3;
@end

@implementation ShorteningLabel

- (void)setFont:(id)a3
{
  id v4 = a3;
  id v5 = [(ShorteningLabel *)self font];

  v6.receiver = self;
  v6.super_class = (Class)ShorteningLabel;
  [(ShorteningLabel *)&v6 setFont:v4];

  if (v5 != v4) {
    [(ShorteningLabel *)self _updateAttributedText];
  }
}

- (void)setAttributedTextAlternatives:(id)a3
{
  id v5 = (NSArray *)a3;
  attributedTextAlternatives = self->_attributedTextAlternatives;
  if (attributedTextAlternatives != v5)
  {
    v8 = v5;
    unsigned __int8 v7 = [(NSArray *)attributedTextAlternatives isEqualToArray:v5];
    id v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_attributedTextAlternatives, a3);
      [(ShorteningLabel *)self _updateAttributedText];
      id v5 = v8;
    }
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)ShorteningLabel;
  [(ShorteningLabel *)&v4 layoutSubviews];
  [(ShorteningLabel *)self bounds];
  if (v3 != self->_lastUpdateWidth) {
    [(ShorteningLabel *)self _updateAttributedText];
  }
}

- (void)_updateAttributedText
{
  [(ShorteningLabel *)self bounds];
  if (v3 > 0.0)
  {
    double v4 = v3;
    id v5 = [(ShorteningLabel *)self attributedTextAlternatives];
    id v6 = [v5 count];

    if (v6)
    {
      unsigned __int8 v7 = [(ShorteningLabel *)self attributedTextAlternatives];
      id v8 = [v7 count];

      if (v8)
      {
        v9 = [(ShorteningLabel *)self attributedTextAlternatives];
        id v10 = [v9 lastObject];

        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v11 = [(ShorteningLabel *)self attributedTextAlternatives];
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
        if (v12)
        {
          id v13 = v12;
          v19 = v10;
          uint64_t v14 = *(void *)v21;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              id v10 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:*(void *)(*((void *)&v20 + 1) + 8 * i)];
              NSAttributedStringKey v24 = NSFontAttributeName;
              v16 = [(ShorteningLabel *)self font];
              v25 = v16;
              v17 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
              [v10 setAttributes:v17 range:NSMakeRange(0, [v10 length])];

              [v10 size];
              if (v18 <= v4)
              {

                goto LABEL_14;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
          id v10 = v19;
        }
LABEL_14:

        [(ShorteningLabel *)self setAttributedText:v10];
      }
      else
      {
        [(ShorteningLabel *)self setAttributedText:0];
      }
      self->_lastUpdateWidth = v4;
    }
  }
}

- (NSArray)attributedTextAlternatives
{
  return self->_attributedTextAlternatives;
}

- (void).cxx_destruct
{
}

@end