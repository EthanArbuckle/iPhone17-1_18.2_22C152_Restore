@interface SUUIViewElementText
- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4;
- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 style:(id)a5;
- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5;
@end

@implementation SUUIViewElementText

- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4
{
  return [(SUUIViewElementText *)self attributedStringWithDefaultFont:a3 foregroundColor:a4 textAlignment:0];
}

- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5
{
  return [(SUUIViewElementText *)self attributedStringWithDefaultFont:a3 foregroundColor:a4 textAlignment:a5 style:0];
}

- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 style:(id)a5
{
  return [(IKTextParser *)self attributedStringWithFont:a3 foregroundColor:a4 textAlignment:0 style:a5];
}

@end