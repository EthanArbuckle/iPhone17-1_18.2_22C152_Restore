@interface NUHTMLBuilder
- (NSMutableString)string;
- (NUHTMLBuilder)init;
- (id)HTML;
- (id)URLEncode:(id)a3;
- (id)appendBreak;
- (id)appendHTML:(id)a3;
- (id)appendLink:(id)a3 withURL:(id)a4;
- (id)appendParagraph:(id)a3;
- (id)appendParagraphText:(id)a3;
- (id)appendStrong:(id)a3;
- (id)appendText:(id)a3;
- (id)encodeHTMLEntities:(id)a3;
- (id)fullHTML;
- (void)setString:(id)a3;
@end

@implementation NUHTMLBuilder

- (NUHTMLBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)NUHTMLBuilder;
  v2 = [(NUHTMLBuilder *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    string = v2->_string;
    v2->_string = v3;
  }
  return v2;
}

- (id)HTML
{
  v2 = [(NUHTMLBuilder *)self string];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)fullHTML
{
  v2 = NSString;
  v3 = [(NUHTMLBuilder *)self string];
  v4 = [v2 stringWithFormat:@"<html><body>%@</body></html>", v3];

  return v4;
}

- (id)appendBreak
{
  v3 = [(NUHTMLBuilder *)self string];
  [v3 appendString:@"<br />"];

  return self;
}

- (id)appendStrong:(id)a3
{
  id v4 = a3;
  v5 = [(NUHTMLBuilder *)self string];
  objc_super v6 = [(NUHTMLBuilder *)self encodeHTMLEntities:v4];

  [v5 appendFormat:@"<strong>%@</strong>", v6];
  return self;
}

- (id)appendParagraph:(id)a3
{
  id v4 = a3;
  v5 = [(NUHTMLBuilder *)self string];
  objc_super v6 = [v4 HTML];

  [v5 appendFormat:@"<p>%@</p>", v6];
  return self;
}

- (id)appendParagraphText:(id)a3
{
  id v4 = a3;
  v5 = [(NUHTMLBuilder *)self string];
  objc_super v6 = [(NUHTMLBuilder *)self encodeHTMLEntities:v4];

  [v5 appendFormat:@"<p>%@</p>", v6];
  return self;
}

- (id)appendLink:(id)a3 withURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(NUHTMLBuilder *)self string];
  v9 = [(NUHTMLBuilder *)self URLEncode:v6];

  v10 = [(NUHTMLBuilder *)self encodeHTMLEntities:v7];

  [v8 appendFormat:@"<a href=\"%@\">%@</a>", v9, v10];
  return self;
}

- (id)appendText:(id)a3
{
  id v4 = a3;
  v5 = [(NUHTMLBuilder *)self string];
  id v6 = [(NUHTMLBuilder *)self encodeHTMLEntities:v4];

  [v5 appendFormat:@"%@", v6];
  return self;
}

- (id)appendHTML:(id)a3
{
  id v4 = a3;
  v5 = [(NUHTMLBuilder *)self string];
  id v6 = [v4 HTML];

  [v5 appendString:v6];
  return self;
}

- (id)encodeHTMLEntities:(id)a3
{
  v3 = (void *)[a3 mutableCopy];
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"&", @"&amp;",
    2,
    0,
    [v3 length]);
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"\", @"&quot;"",
    2,
    0,
    [v3 length]);
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"'", @"&#x27;",
    2,
    0,
    [v3 length]);
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @">", @"&gt;",
    2,
    0,
    [v3 length]);
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&lt;",
    2,
    0,
    [v3 length]);
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)URLEncode:(id)a3
{
  v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  v5 = [v3 URLQueryAllowedCharacterSet];
  id v6 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v5];

  return v6;
}

- (NSMutableString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end