@interface BCCountedCFISetEntryMetadata
- (BOOL)touchesNext;
- (BOOL)touchesPrev;
- (id)description;
- (int64_t)characterCount;
- (void)setCharacterCount:(int64_t)a3;
- (void)setTouchesNext:(BOOL)a3;
- (void)setTouchesPrev:(BOOL)a3;
@end

@implementation BCCountedCFISetEntryMetadata

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int64_t v5 = [(BCCountedCFISetEntryMetadata *)self characterCount];
  if ([(BCCountedCFISetEntryMetadata *)self touchesPrev]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  if ([(BCCountedCFISetEntryMetadata *)self touchesNext]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  v8 = +[NSString stringWithFormat:@"<%@=%p characterCount=%lu touchesPrev=%@ touchesNext=%@>", v4, self, v5, v6, v7];

  return v8;
}

- (int64_t)characterCount
{
  return self->_characterCount;
}

- (void)setCharacterCount:(int64_t)a3
{
  self->_characterCount = a3;
}

- (BOOL)touchesPrev
{
  return self->_touchesPrev;
}

- (void)setTouchesPrev:(BOOL)a3
{
  self->_touchesPrev = a3;
}

- (BOOL)touchesNext
{
  return self->_touchesNext;
}

- (void)setTouchesNext:(BOOL)a3
{
  self->_touchesNext = a3;
}

@end