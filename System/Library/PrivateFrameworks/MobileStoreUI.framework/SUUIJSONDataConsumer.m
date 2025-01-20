@interface SUUIJSONDataConsumer
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SUUIJSONDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  return (id)[MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:a5];
}

@end