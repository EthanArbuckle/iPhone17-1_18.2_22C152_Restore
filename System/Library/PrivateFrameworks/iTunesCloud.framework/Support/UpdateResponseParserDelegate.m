@interface UpdateResponseParserDelegate
- (BOOL)hasAddToLibraryWhenFavoritingBehavior;
- (BOOL)hasAddToPlaylistBehavior;
- (BOOL)hasNeedsResetSync;
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (unsigned)addToLibraryWhenFavoritingBehavior;
- (unsigned)addToPlaylistBehavior;
- (unsigned)needsResetSync;
- (unsigned)serverRevision;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)setAddToLibraryWhenFavoritingBehavior:(unsigned __int8)a3;
- (void)setAddToPlaylistBehavior:(unsigned __int8)a3;
- (void)setHasAddToLibraryWhenFavoritingBehavior:(BOOL)a3;
- (void)setHasAddToPlaylistBehavior:(BOOL)a3;
- (void)setHasNeedsResetSync:(BOOL)a3;
- (void)setNeedsResetSync:(unsigned __int8)a3;
- (void)setServerRevision:(unsigned int)a3;
@end

@implementation UpdateResponseParserDelegate

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  return a4 == 1836413028;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 <= 1634357842)
  {
    if (a4 == 1634354753) {
      return result;
    }
    int v5 = 1634354764;
    goto LABEL_7;
  }
  if (a4 != 1634357843 && a4 != 1836413028)
  {
    int v5 = 1836413810;
LABEL_7:
    if (a4 != v5) {
      return 0;
    }
  }
  return result;
}

- (unsigned)serverRevision
{
  return self->_serverRevision;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  if ((int)a4 > 1634357842)
  {
    if (a4 == 1634357843)
    {
      self->_hasNeedsResetSync = 1;
      self->_needsResetSync = *a5;
    }
    else if (a4 == 1836413810)
    {
      self->_serverRevision = bswap32(*(_DWORD *)a5);
    }
  }
  else if (a4 == 1634354753)
  {
    self->_hasAddToPlaylistBehavior = 1;
    self->_addToPlaylistBehavior = *a5;
  }
  else if (a4 == 1634354764)
  {
    self->_hasAddToLibraryWhenFavoritingBehavior = 1;
    self->_addToLibraryWhenFavoritingBehavior = *a5;
  }
}

- (unsigned)needsResetSync
{
  return self->_needsResetSync;
}

- (BOOL)hasNeedsResetSync
{
  return self->_hasNeedsResetSync;
}

- (BOOL)hasAddToPlaylistBehavior
{
  return self->_hasAddToPlaylistBehavior;
}

- (BOOL)hasAddToLibraryWhenFavoritingBehavior
{
  return self->_hasAddToLibraryWhenFavoritingBehavior;
}

- (unsigned)addToPlaylistBehavior
{
  return self->_addToPlaylistBehavior;
}

- (unsigned)addToLibraryWhenFavoritingBehavior
{
  return self->_addToLibraryWhenFavoritingBehavior;
}

- (void)setNeedsResetSync:(unsigned __int8)a3
{
  self->_needsResetSync = a3;
}

- (void)setAddToLibraryWhenFavoritingBehavior:(unsigned __int8)a3
{
  self->_addToLibraryWhenFavoritingBehavior = a3;
}

- (void)setAddToPlaylistBehavior:(unsigned __int8)a3
{
  self->_addToPlaylistBehavior = a3;
}

- (void)setHasNeedsResetSync:(BOOL)a3
{
  self->_hasNeedsResetSync = a3;
}

- (void)setHasAddToLibraryWhenFavoritingBehavior:(BOOL)a3
{
  self->_hasAddToLibraryWhenFavoritingBehavior = a3;
}

- (void)setHasAddToPlaylistBehavior:(BOOL)a3
{
  self->_hasAddToPlaylistBehavior = a3;
}

- (void)setServerRevision:(unsigned int)a3
{
  self->_serverRevision = a3;
}

@end