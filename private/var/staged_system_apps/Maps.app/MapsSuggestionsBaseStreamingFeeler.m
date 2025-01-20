@interface MapsSuggestionsBaseStreamingFeeler
- (BOOL)startUpdatingSignals;
- (BOOL)stopUpdatingSignals;
- (BOOL)updateSignals;
- (int64_t)disposition;
@end

@implementation MapsSuggestionsBaseStreamingFeeler

- (int64_t)disposition
{
  return 2;
}

- (BOOL)startUpdatingSignals
{
  BOOL result = [(MapsSuggestionsBaseStreamingFeeler *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (BOOL)stopUpdatingSignals
{
  BOOL result = [(MapsSuggestionsBaseStreamingFeeler *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (BOOL)updateSignals
{
  BOOL result = [(MapsSuggestionsBaseStreamingFeeler *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

@end