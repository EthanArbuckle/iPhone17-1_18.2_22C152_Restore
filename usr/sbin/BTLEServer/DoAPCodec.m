@interface DoAPCodec
- ($51C46CB9DB58BED0123AD0ACC1112C59)codec;
- (DoAPCodec)initWithID:(unsigned __int16)a3;
- (unsigned)streamid;
- (void)addCodec:(id *)a3;
- (void)setCodec:(id *)a3;
@end

@implementation DoAPCodec

- (DoAPCodec)initWithID:(unsigned __int16)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DoAPCodec;
  result = [(DoAPCodec *)&v5 init];
  if (result) {
    result->_streamid = a3;
  }
  return result;
}

- (void)addCodec:(id *)a3
{
  $51C46CB9DB58BED0123AD0ACC1112C59 v3 = *a3;
  [(DoAPCodec *)self setCodec:&v3];
}

- (unsigned)streamid
{
  return self->_streamid;
}

- ($51C46CB9DB58BED0123AD0ACC1112C59)codec
{
  *($5FCF269D2EC63528883C20EB67BA15DE *)retstr = *($5FCF269D2EC63528883C20EB67BA15DE *)&self->var5;
  return self;
}

- (void)setCodec:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(_DWORD *)&self->_codec.objectType = *(_DWORD *)&a3->var9;
  *(_OWORD *)&self->_codec.type = v3;
}

@end