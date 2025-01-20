@interface PTAtomWriter
- (BOOL)didBeginAtom;
- (NSError)error;
- (PTAtomWriter)initWithByteWriter:(id)a3;
- (PTAtomWriter)initWithParent:(id)a3;
- (PTAtomWriter)parentWriter;
- (PTByteWriter)byteWriter;
- (id)_errorForByteWriterError:(id)a3;
- (id)_errorForSize:(unint64_t)a3;
- (id)_errorForVersion:(unint64_t)a3;
- (id)debugDescription;
- (unint64_t)atomDataOffset;
- (unint64_t)atomDataSize;
- (unint64_t)atomSize;
- (unint64_t)globalAtomDataOffset;
- (unint64_t)globalAtomOffset;
- (unsigned)atomType;
- (void)_appendBytes:(const void *)a3 size:(unint64_t)a4;
- (void)_debugLogAtomWriterState;
- (void)_debugLogBytes:(const void *)a3 size:(unint64_t)a4;
- (void)_debugLogBytes:(const void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5;
- (void)_setErrorForByteWriterIfNeeded;
- (void)_writeBytes:(const void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5;
- (void)appendBytes:(const void *)a3 size:(unint64_t)a4;
- (void)appendVersion:(unint64_t)a3 flags:(unint64_t)a4;
- (void)beginAtomOfType:(unsigned int)a3;
- (void)endAtom;
- (void)setError:(id)a3;
@end

@implementation PTAtomWriter

- (PTAtomWriter)initWithByteWriter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTAtomWriter;
  v6 = [(PTAtomWriter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_byteWriter, a3);
  }

  return v7;
}

- (PTAtomWriter)initWithParent:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PTAtomWriter;
  v6 = [(PTAtomWriter *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 byteWriter];
    byteWriter = v6->_byteWriter;
    v6->_byteWriter = (PTByteWriter *)v7;

    objc_storeStrong((id *)&v6->_parentWriter, a3);
    uint64_t v9 = [v5 globalAtomOffset];
    v6->_globalAtomOffset = [v5 atomSize] + v9;
  }

  return v6;
}

- (unint64_t)atomDataSize
{
  return self->_atomSize - self->_atomDataOffset;
}

- (unint64_t)globalAtomDataOffset
{
  return self->_atomDataOffset + self->_globalAtomOffset;
}

- (void)beginAtomOfType:(unsigned int)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!self->_error)
  {
    v6[0] = 0;
    v6[1] = bswap32(a3);
    [(PTAtomWriter *)self _appendBytes:v6 size:8];
    id v5 = [(PTAtomWriter *)self error];

    if (!v5)
    {
      self->_atomDataOffset = 8;
      self->_atomSize = 8;
      self->_didBeginAtom = 1;
      self->_atomType = a3;
    }
    [(PTAtomWriter *)self _debugLogAtomWriterState];
    [(PTAtomWriter *)self _setErrorForByteWriterIfNeeded];
  }
}

- (void)appendVersion:(unint64_t)a3 flags:(unint64_t)a4
{
  if (!self->_error && self->_didBeginAtom)
  {
    if (a3 < 0x100)
    {
      unsigned int v8 = bswap32(a4 & 0xFFFFFF | (a3 << 24));
      [(PTAtomWriter *)self _appendBytes:&v8 size:4];
      v6 = [(PTAtomWriter *)self error];

      if (!v6)
      {
        unint64_t v7 = self->_atomSize + 4;
        self->_atomSize = v7;
        self->_atomDataOffset = v7;
      }
    }
    else
    {
      id v5 = -[PTAtomWriter _errorForVersion:](self, "_errorForVersion:");
      [(PTAtomWriter *)self setError:v5];
    }
    [(PTAtomWriter *)self _debugLogAtomWriterState];
    [(PTAtomWriter *)self _setErrorForByteWriterIfNeeded];
  }
}

- (void)appendBytes:(const void *)a3 size:(unint64_t)a4
{
  if (!self->_error && a4 && self->_didBeginAtom)
  {
    [(PTAtomWriter *)self _appendBytes:a3 size:a4];
    v6 = [(PTAtomWriter *)self error];

    if (!v6) {
      self->_atomSize += a4;
    }
    [(PTAtomWriter *)self _debugLogAtomWriterState];
    [(PTAtomWriter *)self _setErrorForByteWriterIfNeeded];
  }
}

- (void)endAtom
{
  if (!self->_error && self->_didBeginAtom)
  {
    unint64_t atomSize = self->_atomSize;
    if (HIDWORD(atomSize))
    {
      v4 = -[PTAtomWriter _errorForSize:](self, "_errorForSize:");
      [(PTAtomWriter *)self setError:v4];
    }
    else
    {
      unsigned int v8 = bswap32(atomSize);
      [(PTAtomWriter *)self _writeBytes:&v8 size:4 offset:self->_globalAtomOffset];
      id v5 = [(PTAtomWriter *)self error];

      if (!v5)
      {
        parentWriter = self->_parentWriter;
        if (parentWriter) {
          parentWriter->_atomSize += self->_atomSize;
        }
        unint64_t v7 = self->_globalAtomOffset + self->_atomSize;
        self->_unint64_t atomSize = 0;
        self->_globalAtomOffset = v7;
        self->_atomDataOffset = 0;
        self->_didBeginAtom = 0;
        self->_atomType = 0;
      }
    }
    [(PTAtomWriter *)self _debugLogAtomWriterState];
    [(PTAtomWriter *)self _setErrorForByteWriterIfNeeded];
    [(PTAtomWriter *)self->_parentWriter _debugLogAtomWriterState];
  }
}

- (void)setError:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_error, a3);
  parentWriter = self->_parentWriter;
  if (parentWriter) {
    [(PTAtomWriter *)parentWriter setError:v6];
  }
}

- (id)debugDescription
{
  unsigned int atomType = self->_atomType;
  if (atomType)
  {
    v4 = NSString;
    id v5 = NSStringFromFourCharCode(atomType);
    id v6 = [v4 stringWithFormat:@"('%@')", v5];
  }
  else
  {
    id v6 = &stru_1F269F3B0;
  }
  unint64_t v7 = NSString;
  unint64_t v8 = [(PTAtomWriter *)self globalAtomOffset];
  unint64_t v9 = [(PTAtomWriter *)self atomSize];
  unint64_t v10 = [(PTAtomWriter *)self atomDataOffset];
  unint64_t v11 = [(PTAtomWriter *)self atomDataSize];
  v12 = [(PTAtomWriter *)self error];
  if (v12)
  {
    v13 = [v7 stringWithFormat:@"atom%@: { offset: %lu, size: %lu }, data: { offset: %lu, size: %lu }%@", v6, v8, v9, v10, v11, &stru_1F269F3B0];
  }
  else
  {
    v14 = NSString;
    v15 = [(PTAtomWriter *)self error];
    v16 = [v14 stringWithFormat:@" (%@)", v15];
    v13 = [v7 stringWithFormat:@"atom%@: { offset: %lu, size: %lu }, data: { offset: %lu, size: %lu }%@", v6, v8, v9, v10, v11, v16];
  }

  return v13;
}

- (void)_appendBytes:(const void *)a3 size:(unint64_t)a4
{
  -[PTAtomWriter _debugLogBytes:size:](self, "_debugLogBytes:size:");
  byteWriter = self->_byteWriter;

  [(PTByteWriter *)byteWriter appendBytes:a3 size:a4];
}

- (void)_writeBytes:(const void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  -[PTAtomWriter _debugLogBytes:size:offset:](self, "_debugLogBytes:size:offset:");
  byteWriter = self->_byteWriter;

  [(PTByteWriter *)byteWriter writeBytes:a3 size:a4 offset:a5];
}

- (void)_setErrorForByteWriterIfNeeded
{
  v3 = [(PTByteWriter *)self->_byteWriter error];

  if (v3)
  {
    id v5 = [(PTByteWriter *)self->_byteWriter error];
    v4 = [(PTAtomWriter *)self _errorForByteWriterError:v5];
    [(PTAtomWriter *)self setError:v4];
  }
}

- (id)_errorForByteWriterError:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)_errorForVersion:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"version %lu is too big to fit", a3);
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28760];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  unint64_t v7 = [v4 errorWithDomain:v5 code:-12572 userInfo:v6];

  return v7;
}

- (id)_errorForSize:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"data size %lu is too big to fit", a3);
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28760];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  unint64_t v7 = [v4 errorWithDomain:v5 code:-12572 userInfo:v6];

  return v7;
}

- (void)_debugLogBytes:(const void *)a3 size:(unint64_t)a4
{
  if (PTSerializationDebugIsEnabled())
  {
    id v6 = _PTLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PTAtomWriter _debugLogBytes:size:]((unsigned __int8 *)a3, a4);
    }
  }
}

- (void)_debugLogBytes:(const void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (PTSerializationDebugIsEnabled())
  {
    unint64_t v8 = _PTLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = NSStringFromBytes((unsigned __int8 *)a3, a4);
      int v10 = 134218242;
      unint64_t v11 = a5;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_debug_impl(&dword_1D0778000, v8, OS_LOG_TYPE_DEBUG, "w[%zd]: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_debugLogAtomWriterState
{
  v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_10(&dword_1D0778000, v2, v3, "%@", v4, v5, v6, v7, 2u);
}

- (PTByteWriter)byteWriter
{
  return (PTByteWriter *)objc_getProperty(self, a2, 16, 1);
}

- (PTAtomWriter)parentWriter
{
  return (PTAtomWriter *)objc_getProperty(self, a2, 24, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)atomSize
{
  return self->_atomSize;
}

- (unint64_t)globalAtomOffset
{
  return self->_globalAtomOffset;
}

- (unint64_t)atomDataOffset
{
  return self->_atomDataOffset;
}

- (BOOL)didBeginAtom
{
  return self->_didBeginAtom;
}

- (unsigned)atomType
{
  return self->_atomType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_parentWriter, 0);

  objc_storeStrong((id *)&self->_byteWriter, 0);
}

- (void)_debugLogBytes:(unsigned __int8 *)a1 size:(uint64_t)a2 .cold.1(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = NSStringFromBytes(a1, a2);
  OUTLINED_FUNCTION_10(&dword_1D0778000, v3, v4, "w[+]: %@", v5, v6, v7, v8, 2u);
}

@end