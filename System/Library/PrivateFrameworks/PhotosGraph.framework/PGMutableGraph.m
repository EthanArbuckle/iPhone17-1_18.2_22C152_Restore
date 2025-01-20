@interface PGMutableGraph
- (id)addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)addNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (id)addUniqueEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)addUniqueNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5 didCreate:(BOOL *)a6;
- (id)addUniquelyIdentifiedNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5 didCreate:(BOOL *)a6;
@end

@implementation PGMutableGraph

- (id)addUniqueEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  LODWORD(v7) = *MEMORY[0x1E4F71F30];
  return [(MAGraph *)self addUniqueEdgeWithLabel:a3 sourceNode:a4 targetNode:a5 domain:a6 weight:a7 properties:v7];
}

- (id)addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  LODWORD(v7) = *MEMORY[0x1E4F71F30];
  return [(MAGraph *)self addEdgeWithLabel:a3 sourceNode:a4 targetNode:a5 domain:a6 weight:a7 properties:v7];
}

- (id)addUniquelyIdentifiedNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5 didCreate:(BOOL *)a6
{
  LODWORD(v6) = *MEMORY[0x1E4F71F30];
  return [(MAGraph *)self addUniquelyIdentifiedNodeWithLabel:a3 domain:a4 weight:a5 properties:a6 didCreate:v6];
}

- (id)addUniqueNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5 didCreate:(BOOL *)a6
{
  LODWORD(v6) = *MEMORY[0x1E4F71F30];
  return [(MAGraph *)self addUniqueNodeWithLabel:a3 domain:a4 weight:a5 properties:a6 didCreate:v6];
}

- (id)addNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  LODWORD(v5) = *MEMORY[0x1E4F71F30];
  return [(MAGraph *)self addNodeWithLabel:a3 domain:a4 weight:a5 properties:v5];
}

@end