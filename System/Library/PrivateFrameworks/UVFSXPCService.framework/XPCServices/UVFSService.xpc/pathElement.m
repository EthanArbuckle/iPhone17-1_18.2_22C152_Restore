@interface pathElement
+ (id)pathElementFromName:(id)a3 withParentFH:(id)a4 withCookie:(unint64_t)a5 andWithCookieVerifier:(unint64_t)a6;
- (NSString)elementName;
- (NSString)parentFH;
- (pathElement)initWithTheName:(id)a3 withParentFH:(id)a4 withCookie:(unint64_t)a5 andWithCookieVerifier:(unint64_t)a6;
- (unint64_t)cookie;
- (unint64_t)cookieVerifier;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)setCookie:(unint64_t)a3;
- (void)setCookieVerifier:(unint64_t)a3;
- (void)setElementName:(id)a3;
- (void)setParentFH:(id)a3;
@end

@implementation pathElement

- (pathElement)initWithTheName:(id)a3 withParentFH:(id)a4 withCookie:(unint64_t)a5 andWithCookieVerifier:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = [(pathElement *)self init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_elementName, a3);
    objc_storeStrong((id *)&v14->_parentFH, a4);
    v14->_cookie = a5;
    v14->_cookieVerifier = a6;
  }

  return v14;
}

+ (id)pathElementFromName:(id)a3 withParentFH:(id)a4 withCookie:(unint64_t)a5 andWithCookieVerifier:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = [objc_alloc((Class)a1) initWithTheName:v11 withParentFH:v10 withCookie:a5 andWithCookieVerifier:a6];

  return v12;
}

- (unint64_t)length
{
  return [(NSString *)self->_elementName length];
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return [(NSString *)self->_elementName characterAtIndex:a3];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (NSString)elementName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setElementName:(id)a3
{
}

- (NSString)parentFH
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setParentFH:(id)a3
{
}

- (unint64_t)cookie
{
  return self->_cookie;
}

- (void)setCookie:(unint64_t)a3
{
  self->_cookie = a3;
}

- (unint64_t)cookieVerifier
{
  return self->_cookieVerifier;
}

- (void)setCookieVerifier:(unint64_t)a3
{
  self->_cookieVerifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFH, 0);

  objc_storeStrong((id *)&self->_elementName, 0);
}

@end