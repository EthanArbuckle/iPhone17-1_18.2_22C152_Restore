@interface MTMLPlaylist
+ (id)playlistWithMPPlaylist:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isFolder;
- (BOOL)isGenius;
- (BOOL)isHidden;
- (BOOL)isOnTheGo;
- (BOOL)isSmart;
- (MPMediaPlaylist)playlist;
- (NSNumber)mediaLibraryId;
- (NSNumber)parentMediaLibraryId;
- (NSString)name;
- (id)children;
- (id)description;
- (void)addChild:(id)a3;
- (void)setIsFolder:(BOOL)a3;
- (void)setIsGenius:(BOOL)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setIsOnTheGo:(BOOL)a3;
- (void)setIsSmart:(BOOL)a3;
- (void)setMediaLibraryId:(id)a3;
- (void)setName:(id)a3;
- (void)setParentMediaLibraryId:(id)a3;
- (void)setPlaylist:(id)a3;
@end

@implementation MTMLPlaylist

+ (id)playlistWithMPPlaylist:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", MPMediaPlaylistPropertyName, MPMediaEntityPropertyPersistentID, MPMediaPlaylistPropertyParentPersistentID, MPMediaPlaylistPropertyIsFolder, MPMediaPlaylistPropertyPlaylistAttributes, MPMediaPlaylistPropertyIsHidden, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DADB0;
  v8[3] = &unk_10054F3A0;
  id v6 = v4;
  id v9 = v6;
  [v3 enumerateValuesForProperties:v5 usingBlock:v8];

  [v6 setPlaylist:v3];

  return v6;
}

- (void)addChild:(id)a3
{
  id v4 = a3;
  children = self->_children;
  id v8 = v4;
  if (!children)
  {
    id v6 = +[NSMutableArray array];
    v7 = self->_children;
    self->_children = v6;

    id v4 = v8;
    children = self->_children;
  }
  [(NSMutableArray *)children addObject:v4];
}

- (id)children
{
  return self->_children;
}

- (BOOL)isEmpty
{
  if (!self->_cachedEmpty)
  {
    if ([(MTMLPlaylist *)self isFolder] && ![(NSMutableArray *)self->_children count])
    {
      BOOL v3 = 1;
    }
    else
    {
      if (![(MTMLPlaylist *)self isFolder])
      {
        BOOL v3 = 0;
        self->_empty = 0;
LABEL_20:
        self->_cachedEmpty = 1;
        return v3;
      }
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v4 = self->_children;
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v11;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v4);
            }
            if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isEmpty", (void)v10))
            {
              BOOL v3 = 0;
              goto LABEL_17;
            }
          }
          id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      BOOL v3 = 1;
LABEL_17:
    }
    self->_empty = v3;
    goto LABEL_20;
  }
  return self->_empty;
}

- (id)description
{
  BOOL v3 = [(MTMLPlaylist *)self mediaLibraryId];
  id v4 = [(MTMLPlaylist *)self name];
  id v5 = +[NSNumber numberWithBool:[(MTMLPlaylist *)self isFolder]];
  id v6 = +[NSString stringWithFormat:@"[%@] %@ %@", v3, v4, v5];

  return v6;
}

- (MPMediaPlaylist)playlist
{
  return (MPMediaPlaylist *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPlaylist:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)mediaLibraryId
{
  return self->_mediaLibraryId;
}

- (void)setMediaLibraryId:(id)a3
{
}

- (NSNumber)parentMediaLibraryId
{
  return self->_parentMediaLibraryId;
}

- (void)setParentMediaLibraryId:(id)a3
{
}

- (BOOL)isFolder
{
  return self->_isFolder;
}

- (void)setIsFolder:(BOOL)a3
{
  self->_isFolder = a3;
}

- (BOOL)isGenius
{
  return self->_isGenius;
}

- (void)setIsGenius:(BOOL)a3
{
  self->_isGenius = a3;
}

- (BOOL)isOnTheGo
{
  return self->_isOnTheGo;
}

- (void)setIsOnTheGo:(BOOL)a3
{
  self->_isOnTheGo = a3;
}

- (BOOL)isSmart
{
  return self->_isSmart;
}

- (void)setIsSmart:(BOOL)a3
{
  self->_isSmart = a3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentMediaLibraryId, 0);
  objc_storeStrong((id *)&self->_mediaLibraryId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_playlist, 0);

  objc_storeStrong((id *)&self->_children, 0);
}

@end