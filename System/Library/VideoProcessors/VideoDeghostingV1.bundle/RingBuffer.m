@interface RingBuffer
- (RingBuffer)initWithLength:(int)a3 dataTypeSize:(unint64_t)a4;
- (int)count;
- (int)firstElementIndex;
- (int)lastElementIndex;
- (int)lastElementIndexPlusOne;
- (int)maxSize;
- (void)appendElement:(void *)a3;
- (void)dealloc;
- (void)elementAtIndex:(int)a3;
- (void)firstElement;
- (void)incrementRingIndex:(int *)a3;
- (void)incrementRingIndex:(int *)a3 withCount:(int)a4;
- (void)lastElement;
- (void)removeFirstElements:(int)a3;
@end

@implementation RingBuffer

- (RingBuffer)initWithLength:(int)a3 dataTypeSize:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)RingBuffer;
  v6 = [(RingBuffer *)&v11 init];
  v7 = v6;
  if (v6
    && (v6->_length = a3 + 1,
        v6->_typeSize = a4,
        *(void *)&v6->_outputIndex = 0,
        v8 = malloc_type_malloc((a3 + 1) * a4, 0xF87950BEuLL),
        (v7->_ringBuffer = v8) == 0))
  {
    v9 = 0;
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (void)dealloc
{
  free(self->_ringBuffer);
  v3.receiver = self;
  v3.super_class = (Class)RingBuffer;
  [(RingBuffer *)&v3 dealloc];
}

- (int)maxSize
{
  return self->_length;
}

- (void)incrementRingIndex:(int *)a3
{
  *a3 = (*a3 + 1) % self->_length;
}

- (void)incrementRingIndex:(int *)a3 withCount:(int)a4
{
  *a3 = (*a3 + a4) % self->_length;
}

- (void)appendElement:(void *)a3
{
  signed int v5 = [(RingBuffer *)self count];
  int length = self->_length;
  if (v5 >= length - 1) {
    [(RingBuffer *)self removeFirstElements:(v5 - length + 2)];
  }
  if ([(RingBuffer *)self count] < self->_length - 1)
  {
    memcpy((char *)self->_ringBuffer + self->_typeSize * self->_inputIndex, a3, self->_typeSize);
    [(RingBuffer *)self incrementRingIndex:&self->_inputIndex];
  }
}

- (void)removeFirstElements:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(RingBuffer *)self count] < a3) {
    uint64_t v3 = [(RingBuffer *)self count];
  }

  [(RingBuffer *)self incrementRingIndex:&self->_outputIndex withCount:v3];
}

- (int)firstElementIndex
{
  return self->_outputIndex;
}

- (int)lastElementIndex
{
  return (self->_length + self->_inputIndex - 1) % self->_length;
}

- (int)lastElementIndexPlusOne
{
  return self->_inputIndex;
}

- (void)elementAtIndex:(int)a3
{
  return (char *)self->_ringBuffer + self->_typeSize * a3;
}

- (void)firstElement
{
  if ([(RingBuffer *)self count] < 1) {
    return 0;
  }
  uint64_t outputIndex = self->_outputIndex;

  return [(RingBuffer *)self elementAtIndex:outputIndex];
}

- (void)lastElement
{
  if ([(RingBuffer *)self count] < 1) {
    return 0;
  }
  uint64_t v3 = [(RingBuffer *)self lastElementIndex];

  return [(RingBuffer *)self elementAtIndex:v3];
}

- (int)count
{
  return (self->_inputIndex + self->_length - self->_outputIndex) % self->_length;
}

@end