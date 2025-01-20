@interface _CHCSVAggregator
- (NSError)error;
- (NSMutableArray)currentLine;
- (NSMutableArray)lines;
- (void)parser:(id)a3 didBeginLine:(unint64_t)a4;
- (void)parser:(id)a3 didEndLine:(unint64_t)a4;
- (void)parser:(id)a3 didFailWithError:(id)a4;
- (void)parser:(id)a3 didReadField:(id)a4 atIndex:(int64_t)a5;
- (void)parserDidBeginDocument:(id)a3;
- (void)setCurrentLine:(id)a3;
- (void)setError:(id)a3;
- (void)setLines:(id)a3;
@end

@implementation _CHCSVAggregator

- (void)parserDidBeginDocument:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(_CHCSVAggregator *)self setLines:v4];
}

- (void)parser:(id)a3 didBeginLine:(unint64_t)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(_CHCSVAggregator *)self setCurrentLine:v5];
}

- (void)parser:(id)a3 didEndLine:(unint64_t)a4
{
  id v5 = [(_CHCSVAggregator *)self lines];
  v6 = [(_CHCSVAggregator *)self currentLine];
  [v5 addObject:v6];

  [(_CHCSVAggregator *)self setCurrentLine:0];
}

- (void)parser:(id)a3 didReadField:(id)a4 atIndex:(int64_t)a5
{
  id v6 = a4;
  id v7 = [(_CHCSVAggregator *)self currentLine];
  [v7 addObject:v6];
}

- (void)parser:(id)a3 didFailWithError:(id)a4
{
  [(_CHCSVAggregator *)self setError:a4];
  [(_CHCSVAggregator *)self setLines:0];
}

- (NSMutableArray)lines
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLines:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
}

- (NSMutableArray)currentLine
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLine, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lines, 0);
}

@end