@interface PTAtomStream
- (BOOL)didReadAtomVersionAndFlags;
- (BOOL)hasAtom;
- (BOOL)isAtEndOfStream;
- (NSError)error;
- (PTAtomStream)initWithByteStream:(id)a3;
- (PTAtomStream)initWithByteStream:(id)a3 offset:(unint64_t)a4;
- (PTAtomStream)initWithParent:(id)a3;
- (PTAtomStream)initWithParent:(id)a3 offset:(unint64_t)a4;
- (PTAtomStream)parentStream;
- (PTByteStream)byteStream;
- (id)_errorForByteStreamError:(id)a3;
- (id)_errorForReadPastLimit:(unint64_t)a3 size:(unint64_t)a4 offset:(unint64_t)a5;
- (id)debugDescription;
- (unint64_t)atomDataOffset;
- (unint64_t)atomDataSize;
- (unint64_t)atomFlags;
- (unint64_t)atomSize;
- (unint64_t)atomVersion;
- (unint64_t)globalAtomDataOffset;
- (unint64_t)globalAtomOffset;
- (unint64_t)globalEndOffset;
- (unsigned)atomType;
- (void)_debugLogAtomReaderState;
- (void)_debugLogBytes:(const void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5;
- (void)_readAtomHeader;
- (void)_readBytes:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5;
- (void)_setEndOfStream;
- (void)_setErrorForByteStreamIfNeeded;
- (void)advanceToNextAtom;
- (void)readCurrentAtomDataBytes:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5;
- (void)readCurrentAtomVersionAndFlags;
- (void)setError:(id)a3;
@end

@implementation PTAtomStream

- (PTAtomStream)initWithByteStream:(id)a3
{
  return [(PTAtomStream *)self initWithByteStream:a3 offset:0];
}

- (PTAtomStream)initWithByteStream:(id)a3 offset:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PTAtomStream;
  v8 = [(PTAtomStream *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_byteStream, a3);
    v9->_globalAtomOffset = a4;
    v9->_globalEndOffset = [v7 size];
    [(PTAtomStream *)v9 _readAtomHeader];
  }

  return v9;
}

- (PTAtomStream)initWithParent:(id)a3
{
  return [(PTAtomStream *)self initWithParent:a3 offset:0];
}

- (PTAtomStream)initWithParent:(id)a3 offset:(unint64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PTAtomStream;
  v8 = [(PTAtomStream *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parentStream, a3);
    uint64_t v10 = [v7 byteStream];
    byteStream = v9->_byteStream;
    v9->_byteStream = (PTByteStream *)v10;

    v9->_globalAtomOffset = [v7 globalAtomDataOffset] + a4;
    uint64_t v12 = [v7 globalAtomOffset];
    v9->_globalEndOffset = [v7 atomSize] + v12;
    [(PTAtomStream *)v9 _readAtomHeader];
  }

  return v9;
}

- (BOOL)hasAtom
{
  v3 = [(PTAtomStream *)self error];
  if (v3) {
    LOBYTE(v4) = 0;
  }
  else {
    BOOL v4 = ![(PTAtomStream *)self isAtEndOfStream];
  }

  return v4;
}

- (unint64_t)atomDataSize
{
  return self->_atomSize - self->_atomDataOffset;
}

- (unint64_t)globalAtomDataOffset
{
  return self->_atomDataOffset + self->_globalAtomOffset;
}

- (void)readCurrentAtomVersionAndFlags
{
  if (!self->_error && !self->_didReadAtomVersionAndFlags)
  {
    unsigned int v4 = 0;
    [(PTAtomStream *)self readCurrentAtomDataBytes:&v4 size:4 offset:0];
    unsigned int v3 = bswap32(v4);
    unsigned int v4 = v3;
    self->_atomVersion = HIBYTE(v3);
    self->_atomFlags = v3 & 0xFFFFFF;
    self->_atomDataOffset += 4;
    self->_didReadAtomVersionAndFlags = 1;
    [(PTAtomStream *)self _debugLogAtomReaderState];
    [(PTAtomStream *)self _setErrorForByteStreamIfNeeded];
  }
}

- (void)readCurrentAtomDataBytes:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  if (!self->_error)
  {
    [(PTAtomStream *)self _readBytes:a3 size:a4 offset:[(PTAtomStream *)self globalAtomDataOffset] + a5];
    [(PTAtomStream *)self _debugLogAtomReaderState];
    [(PTAtomStream *)self _setErrorForByteStreamIfNeeded];
  }
}

- (void)advanceToNextAtom
{
  if (!self->_error)
  {
    unint64_t globalEndOffset = self->_globalEndOffset;
    unint64_t v4 = self->_globalAtomOffset + self->_atomSize;
    self->_globalAtomOffset = v4;
    if (v4 >= globalEndOffset) {
      [(PTAtomStream *)self _setEndOfStream];
    }
    else {
      [(PTAtomStream *)self _readAtomHeader];
    }
    [(PTAtomStream *)self _debugLogAtomReaderState];
    [(PTAtomStream *)self _setErrorForByteStreamIfNeeded];
  }
}

- (void)setError:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_error, a3);
  parentStream = self->_parentStream;
  if (parentStream) {
    [(PTAtomStream *)parentStream setError:v6];
  }
}

- (id)debugDescription
{
  unsigned int atomType = self->_atomType;
  if (atomType)
  {
    unint64_t v4 = NSString;
    v5 = NSStringFromFourCharCode(atomType);
    id v6 = [v4 stringWithFormat:@"('%@')", v5];
  }
  else
  {
    id v6 = &stru_1F269F3B0;
  }
  id v7 = NSString;
  unint64_t v8 = [(PTAtomStream *)self globalAtomOffset];
  unint64_t v9 = [(PTAtomStream *)self atomSize];
  unint64_t v10 = [(PTAtomStream *)self atomDataOffset];
  unint64_t v11 = [(PTAtomStream *)self atomDataSize];
  uint64_t v12 = [(PTAtomStream *)self error];
  if (v12)
  {
    v13 = [v7 stringWithFormat:@"atom%@: { offset: %lu, size: %lu }, data: { offset: %lu, size: %lu }%@", v6, v8, v9, v10, v11, &stru_1F269F3B0];
  }
  else
  {
    objc_super v14 = NSString;
    v15 = [(PTAtomStream *)self error];
    v16 = [v14 stringWithFormat:@" (%@)", v15];
    v13 = [v7 stringWithFormat:@"atom%@: { offset: %lu, size: %lu }, data: { offset: %lu, size: %lu }%@", v6, v8, v9, v10, v11, v16];
  }

  return v13;
}

- (void)_setEndOfStream
{
  self->_unsigned int atomType = 0;
  self->_atomSize = 0;
  self->_atomDataOffset = 0;
  *(_WORD *)&self->_atEndOfStream = 1;
  self->_atomVersion = 0;
  self->_atomFlags = 0;
}

- (void)_readAtomHeader
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (!self->_error)
  {
    v5[0] = 0;
    [(PTAtomStream *)self _readBytes:v5 size:8 offset:self->_globalAtomOffset];
    unsigned int v3 = [(PTAtomStream *)self error];

    if (!v3)
    {
      unint64_t v4 = bswap32(v5[0]);
      self->_unsigned int atomType = bswap32(HIDWORD(v5[0]));
      self->_atomSize = v4;
      self->_atomDataOffset = 8;
      self->_didReadAtomVersionAndFlags = 0;
      self->_atomVersion = 0;
      self->_atomFlags = 0;
    }
    [(PTAtomStream *)self _debugLogAtomReaderState];
    [(PTAtomStream *)self _setErrorForByteStreamIfNeeded];
  }
}

- (void)_readBytes:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  if (a5 + a4 <= self->_globalEndOffset)
  {
    [(PTByteStream *)self->_byteStream readBytes:a3 size:a4 offset:a5];
    [(PTAtomStream *)self _debugLogBytes:a3 size:a4 offset:a5];
  }
  else
  {
    -[PTAtomStream _errorForReadPastLimit:size:offset:](self, "_errorForReadPastLimit:size:offset:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [(PTAtomStream *)self setError:v9];
  }
}

- (void)_setErrorForByteStreamIfNeeded
{
  unsigned int v3 = [(PTByteStream *)self->_byteStream error];

  if (v3)
  {
    id v5 = [(PTByteStream *)self->_byteStream error];
    unint64_t v4 = [(PTAtomStream *)self _errorForByteStreamError:v5];
    [(PTAtomStream *)self setError:v4];
  }
}

- (id)_errorForByteStreamError:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)_errorForReadPastLimit:(unint64_t)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(NSString, "stringWithFormat:", @"attempt to read past end %lu (offset %lu; size %lu)",
    a3,
    a5,
  id v5 = a4);
  id v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28760];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = v5;
  unint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [v6 errorWithDomain:v7 code:-19 userInfo:v8];

  return v9;
}

- (void)_debugLogBytes:(const void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (PTSerializationDebugIsEnabled())
  {
    unint64_t v8 = _PTLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = NSStringFromBytes((unsigned __int8 *)a3, a4);
      int v10 = 134218242;
      unint64_t v11 = a5;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_debug_impl(&dword_1D0778000, v8, OS_LOG_TYPE_DEBUG, "r[%zd]: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_debugLogAtomReaderState
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 debugDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_1D0778000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v4, 0xCu);
}

- (PTByteStream)byteStream
{
  return (PTByteStream *)objc_getProperty(self, a2, 16, 1);
}

- (PTAtomStream)parentStream
{
  return (PTAtomStream *)objc_getProperty(self, a2, 24, 1);
}

- (unsigned)atomType
{
  return self->_atomType;
}

- (unint64_t)atomVersion
{
  return self->_atomVersion;
}

- (unint64_t)atomFlags
{
  return self->_atomFlags;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)atomSize
{
  return self->_atomSize;
}

- (unint64_t)atomDataOffset
{
  return self->_atomDataOffset;
}

- (unint64_t)globalAtomOffset
{
  return self->_globalAtomOffset;
}

- (unint64_t)globalEndOffset
{
  return self->_globalEndOffset;
}

- (BOOL)isAtEndOfStream
{
  return self->_atEndOfStream;
}

- (BOOL)didReadAtomVersionAndFlags
{
  return self->_didReadAtomVersionAndFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_parentStream, 0);

  objc_storeStrong((id *)&self->_byteStream, 0);
}

@end