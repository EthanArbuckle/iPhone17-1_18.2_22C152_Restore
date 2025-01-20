@interface FTWebVTTTranscriptionResult
- (BOOL)isEmptyCueOut;
- (NSError)error;
- (NSString)text;
- (void)setError:(id)a3;
- (void)setIsEmptyCueOut:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation FTWebVTTTranscriptionResult

- (NSString)text
{
  return self->text;
}

- (void)setText:(id)a3
{
}

- (BOOL)isEmptyCueOut
{
  return self->isEmptyCueOut;
}

- (void)setIsEmptyCueOut:(BOOL)a3
{
  self->isEmptyCueOut = a3;
}

- (NSError)error
{
  return self->error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->error, 0);

  objc_storeStrong((id *)&self->text, 0);
}

@end