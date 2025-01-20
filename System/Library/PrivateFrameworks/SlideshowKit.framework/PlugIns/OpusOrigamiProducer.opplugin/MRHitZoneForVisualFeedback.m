@interface MRHitZoneForVisualFeedback
- (BOOL)hasEnded;
- (double)timestamp;
- (float)vertices;
- (unint64_t)countOfVertices;
- (void)dealloc;
- (void)set2DVertices:(const float *)a3 countOfVertices:(unint64_t)a4;
- (void)setHasEnded:(BOOL)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation MRHitZoneForVisualFeedback

- (void)dealloc
{
  vertices = self->_vertices;
  if (vertices)
  {
    free(vertices);
    self->_vertices = 0;
  }
  self->_countOfVertices = 0;
  v4.receiver = self;
  v4.super_class = (Class)MRHitZoneForVisualFeedback;
  [(MRHitZoneForVisualFeedback *)&v4 dealloc];
}

- (void)set2DVertices:(const float *)a3 countOfVertices:(unint64_t)a4
{
  vertices = self->_vertices;
  if (vertices) {
    free(vertices);
  }
  v8 = (float *)malloc_type_malloc(8 * a4, 0x6032D7DCuLL);
  self->_vertices = v8;
  memcpy(v8, a3, 8 * a4);
  self->_countOfVertices = a4;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (float)vertices
{
  return self->_vertices;
}

- (unint64_t)countOfVertices
{
  return self->_countOfVertices;
}

@end