@interface BEReadingSystemJS
- (BEReadingSystemJS)initWithPaginationMode:(unint64_t)a3;
- (id)_layoutStyleForPaginationMode:(unint64_t)a3;
- (id)_scriptReplacements;
- (id)_supportsMouseEvents;
- (id)_supportsTouchEvents;
- (id)anyFrameJavascript:(int64_t)a3;
- (id)anyFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameOnlyJavascript:(int64_t)a3;
- (unint64_t)paginationMode;
- (void)setPaginationMode:(unint64_t)a3;
@end

@implementation BEReadingSystemJS

- (BEReadingSystemJS)initWithPaginationMode:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BEReadingSystemJS;
  result = [(BEReadingSystemJS *)&v5 init];
  if (result) {
    result->_paginationMode = a3;
  }
  return result;
}

- (id)_layoutStyleForPaginationMode:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"scrolling";
  }
  else {
    return *(&off_3C1590 + a3 - 1);
  }
}

- (id)_supportsTouchEvents
{
  return @"true";
}

- (id)_supportsMouseEvents
{
  return @"false";
}

- (id)_scriptReplacements
{
  v3 = [(BEReadingSystemJS *)self _layoutStyleForPaginationMode:self->_paginationMode];
  v9[0] = v3;
  v8[0] = @"layoutStyle";
  v8[1] = @"touchEvents";
  v4 = [(BEReadingSystemJS *)self _supportsTouchEvents];
  v9[1] = v4;
  v8[2] = @"mouseEvents";
  objc_super v5 = [(BEReadingSystemJS *)self _supportsMouseEvents];
  v9[2] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)mainFrameOnlyJavascript:(int64_t)a3
{
  return 0;
}

- (id)mainFrameJavascriptURL:(int64_t)a3
{
  return 0;
}

- (id)anyFrameJavascript:(int64_t)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    objc_super v5 = +[reading_system source];
    v6 = [(BEReadingSystemJS *)self _scriptReplacements];
    v3 = +[BESimpleTemplate javascriptStringFromJavascriptSource:v5 replacements:v6];
  }

  return v3;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v4 = +[reading_system sourceName];
    v3 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v4);
  }

  return v3;
}

- (unint64_t)paginationMode
{
  return self->_paginationMode;
}

- (void)setPaginationMode:(unint64_t)a3
{
  self->_paginationMode = a3;
}

@end