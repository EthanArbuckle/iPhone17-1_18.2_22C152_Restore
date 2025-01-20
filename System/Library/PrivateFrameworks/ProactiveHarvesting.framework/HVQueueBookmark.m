@interface HVQueueBookmark
- (BMBookmark)futureBookmark;
- (BMBookmark)pastBookmark;
- (NSNumber)futureCutoff;
- (id)jsonDict;
- (unsigned)los;
- (void)reset;
- (void)setFutureBookmark:(id)a3;
- (void)setFutureCutoff:(id)a3;
- (void)setLos:(unsigned __int8)a3;
- (void)setPastBookmark:(id)a3;
@end

@implementation HVQueueBookmark

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_futureBookmark, 0);
  objc_storeStrong((id *)&self->_futureCutoff, 0);

  objc_storeStrong((id *)&self->_pastBookmark, 0);
}

- (void)setFutureBookmark:(id)a3
{
}

- (BMBookmark)futureBookmark
{
  return self->_futureBookmark;
}

- (void)setFutureCutoff:(id)a3
{
}

- (NSNumber)futureCutoff
{
  return self->_futureCutoff;
}

- (void)setPastBookmark:(id)a3
{
}

- (BMBookmark)pastBookmark
{
  return self->_pastBookmark;
}

- (void)setLos:(unsigned __int8)a3
{
  self->_los = a3;
}

- (unsigned)los
{
  return self->_los;
}

- (id)jsonDict
{
  v13[4] = *MEMORY[0x263EF8340];
  v12[0] = @"los";
  v3 = [NSNumber numberWithUnsignedChar:self->_los];
  v13[0] = v3;
  v12[1] = @"pastBookmark";
  v4 = [(BMBookmark *)self->_pastBookmark debugDescription];
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF9D0] null];
  }
  v13[1] = v5;
  v12[2] = @"futureCutoff";
  futureCutoff = self->_futureCutoff;
  v7 = futureCutoff;
  if (!futureCutoff)
  {
    v7 = [MEMORY[0x263EFF9D0] null];
  }
  v13[2] = v7;
  v12[3] = @"futureBookmark";
  v8 = [(BMBookmark *)self->_futureBookmark debugDescription];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x263EFF9D0] null];
  }
  v13[3] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
  if (!v8) {

  }
  if (futureCutoff)
  {
    if (v4) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v4) {
      goto LABEL_11;
    }
  }

LABEL_11:

  return v10;
}

- (void)reset
{
  self->_los = 0;
  pastBookmark = self->_pastBookmark;
  self->_pastBookmark = 0;

  futureCutoff = self->_futureCutoff;
  self->_futureCutoff = 0;

  futureBookmark = self->_futureBookmark;
  self->_futureBookmark = 0;
}

@end