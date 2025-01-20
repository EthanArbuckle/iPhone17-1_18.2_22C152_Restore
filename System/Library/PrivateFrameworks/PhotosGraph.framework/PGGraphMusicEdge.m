@interface PGGraphMusicEdge
+ (id)filter;
- (PGGraphMusicEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromMomentNode:(id)a3 toMusicSessionNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphMusicEdge

- (unsigned)domain
{
  return 1000;
}

- (id)label
{
  v2 = @"MUSIC_SESSION";
  return @"MUSIC_SESSION";
}

- (PGGraphMusicEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphMusicEdge *)[(PGGraphMusicEdge *)self initFromMomentNode:a4 toMusicSessionNode:a5];
}

- (id)initFromMomentNode:(id)a3 toMusicSessionNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphMusicEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"MUSIC_SESSION" domain:1000];
  return v2;
}

@end