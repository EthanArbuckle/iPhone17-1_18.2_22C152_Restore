@interface SSVURLJSONDataConsumer
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SSVURLJSONDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  return (id)[MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:a5];
}

@end