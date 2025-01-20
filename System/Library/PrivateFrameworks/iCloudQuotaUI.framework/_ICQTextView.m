@interface _ICQTextView
- (BOOL)canBecomeFirstResponder;
- (NSArray)links;
- (NSDictionary)attributes;
- (NSString)format;
- (_ICQTextView)initWithFrame:(CGRect)a3;
- (void)setAttributedText;
- (void)setAttributes:(id)a3;
- (void)setFormat:(id)a3;
- (void)setLinks:(id)a3;
@end

@implementation _ICQTextView

- (_ICQTextView)initWithFrame:(CGRect)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)_ICQTextView;
  v3 = -[_ICQTextView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_ICQTextView *)v3 setSelectable:1];
    [(_ICQTextView *)v4 setEditable:0];
    [(_ICQTextView *)v4 setScrollEnabled:0];
    v5 = [(_ICQTextView *)v4 textDragInteraction];
    [v5 setEnabled:0];

    [(_ICQTextView *)v4 setAdjustsFontForContentSizeCategory:1];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = [(_ICQTextView *)v4 gestureRecognizers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v11;
            [v12 minimumPressDuration];
            if (v13 >= 0.499999881) {
              [v12 setEnabled:0];
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v8);
    }
  }
  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)setAttributedText
{
  v3 = (void *)MEMORY[0x263F086A0];
  id v7 = [(_ICQTextView *)self format];
  v4 = [(_ICQTextView *)self attributes];
  v5 = [(_ICQTextView *)self links];
  v6 = [v3 attributedStringWithFormat:v7 attributes:v4 links:v5];
  [(_ICQTextView *)self setAttributedText:v6];
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

@end