@interface _MFSearchMatcherContext
- (CPSearchMatcher)lastMatcher;
- (NSMutableDictionary)matchers;
- (char)lastSearchString;
- (unint64_t)lastSearchStringLength;
- (void)dealloc;
- (void)flush;
- (void)setLastMatcher:(id)a3;
- (void)setLastSearchString:(char *)a3;
- (void)setLastSearchStringLength:(unint64_t)a3;
- (void)setMatchers:(id)a3;
@end

@implementation _MFSearchMatcherContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchers, 0);
  objc_storeStrong((id *)&self->_lastMatcher, 0);
}

- (void)dealloc
{
  lastSearchString = self->_lastSearchString;
  if (lastSearchString) {
    free(lastSearchString);
  }
  v4.receiver = self;
  v4.super_class = (Class)_MFSearchMatcherContext;
  [(_MFSearchMatcherContext *)&v4 dealloc];
}

- (void)flush
{
}

- (CPSearchMatcher)lastMatcher
{
  return self->_lastMatcher;
}

- (void)setLastMatcher:(id)a3
{
}

- (char)lastSearchString
{
  return self->_lastSearchString;
}

- (void)setLastSearchString:(char *)a3
{
  self->_lastSearchString = a3;
}

- (unint64_t)lastSearchStringLength
{
  return self->_lastSearchStringLength;
}

- (void)setLastSearchStringLength:(unint64_t)a3
{
  self->_lastSearchStringLength = a3;
}

- (NSMutableDictionary)matchers
{
  return self->_matchers;
}

- (void)setMatchers:(id)a3
{
}

@end