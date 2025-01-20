@interface BTAVRCP_MyMusicFolder
- (BTAVRCP_MyMusicFolder)initWithName:(id)a3 uid:(unint64_t)a4;
- (NSArray)activeCategories;
- (id)baseQuery;
- (id)folderNameForUid:(unint64_t)a3;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)folderTypeForUid:(unint64_t)a3;
- (unsigned)playItemWithUid:(unint64_t)a3;
- (void)dealloc;
- (void)refreshActiveCategories;
- (void)setActiveCategories:(id)a3;
@end

@implementation BTAVRCP_MyMusicFolder

- (BTAVRCP_MyMusicFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BTAVRCP_MyMusicFolder;
  v4 = [(BTAVRCP_VFSFolder *)&v8 initWithName:a3 uid:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"refreshActiveCategories" name:MPMediaLibraryDidChangeNotification object:0];

    v6 = +[MPMediaLibrary defaultMediaLibrary];
    [v6 beginGeneratingLibraryChangeNotifications];

    [(BTAVRCP_MyMusicFolder *)v4 refreshActiveCategories];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[MPMediaLibrary defaultMediaLibrary];
  [v3 endGeneratingLibraryChangeNotifications];

  v4.receiver = self;
  v4.super_class = (Class)BTAVRCP_MyMusicFolder;
  [(BTAVRCP_MyMusicFolder *)&v4 dealloc];
}

- (void)refreshActiveCategories
{
  id v12 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v3 = 1;
  while (2)
  {
    switch(v3)
    {
      case 1:
        objc_super v4 = +[MPMediaLibrary defaultMediaLibrary];
        unsigned int v5 = [v4 hasArtists];

        if (v5) {
          goto LABEL_12;
        }
        goto LABEL_13;
      case 2:
        v6 = +[MPMediaLibrary defaultMediaLibrary];
        unsigned __int8 v7 = [v6 hasAlbums];
        goto LABEL_9;
      case 3:
        v6 = +[MPMediaLibrary defaultMediaLibrary];
        unsigned __int8 v7 = [v6 hasSongs];
        goto LABEL_9;
      case 4:
        v6 = +[MPMediaLibrary defaultMediaLibrary];
        unsigned __int8 v7 = [v6 hasGenres];
        goto LABEL_9;
      case 5:
        v6 = +[MPMediaLibrary defaultMediaLibrary];
        unsigned __int8 v7 = [v6 hasComposers];
LABEL_9:
        unsigned __int8 v8 = v7;

        if ((v8 & 1) == 0) {
          goto LABEL_13;
        }
        goto LABEL_12;
      case 6:
        v9 = +[MPMediaLibrary defaultMediaLibrary];
        unsigned __int8 v10 = [v9 hasCompilations];

        if ((v10 & 1) == 0) {
          goto LABEL_14;
        }
LABEL_12:
        v11 = +[NSNumber numberWithUnsignedLongLong:v3];
        [v12 addObject:v11];

LABEL_13:
        if (++v3 != 7) {
          continue;
        }
LABEL_14:
        [(BTAVRCP_MyMusicFolder *)self setActiveCategories:v12];

        return;
      default:
        goto LABEL_13;
    }
  }
}

- (id)folderNameForUid:(unint64_t)a3
{
  objc_super v4 = +[NSBundle mobileBluetoothBundle];
  unsigned int v5 = v4;
  switch(a3)
  {
    case 1uLL:
      CFStringRef v6 = @"ARTISTS";
      CFStringRef v7 = @"Artists";
      goto LABEL_9;
    case 2uLL:
      CFStringRef v6 = @"ALBUMS";
      CFStringRef v7 = @"Albums";
      goto LABEL_9;
    case 3uLL:
      CFStringRef v6 = @"SONGS";
      CFStringRef v7 = @"Songs";
      goto LABEL_9;
    case 4uLL:
      CFStringRef v6 = @"GENRES";
      CFStringRef v7 = @"Genres";
      goto LABEL_9;
    case 5uLL:
      CFStringRef v6 = @"COMPOSERS";
      CFStringRef v7 = @"Composers";
      goto LABEL_9;
    case 6uLL:
      CFStringRef v6 = @"COMPILATIONS";
      CFStringRef v7 = @"Compilations";
LABEL_9:
      unsigned __int8 v8 = [v4 localizedStringForKey:v6 value:v7 table:0];
      break;
    default:
      unsigned __int8 v8 = 0;
      break;
  }

  return v8;
}

- (unsigned)folderTypeForUid:(unint64_t)a3
{
  unint64_t v3 = 0x2030401020300uLL >> (8 * a3);
  if (a3 >= 7) {
    LOBYTE(v3) = 0;
  }
  return v3 & 7;
}

- (id)baseQuery
{
  return +[MPMediaQuery songsQuery];
}

- (unint64_t)childrenCount
{
  v2 = [(BTAVRCP_MyMusicFolder *)self activeCategories];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  CFStringRef v7 = [(BTAVRCP_MyMusicFolder *)self activeCategories];
  unsigned __int8 v8 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned int v9 = [v7 containsObject:v8];

  if (!v9) {
    return 9;
  }
  switch(a3)
  {
    case 1uLL:
      unsigned __int8 v10 = [BTAVRCP_ArtistsFolder alloc];
      v11 = [(BTAVRCP_MyMusicFolder *)self folderNameForUid:1];
      id v12 = v10;
      v13 = v11;
      uint64_t v14 = 1;
      goto LABEL_9;
    case 2uLL:
      v16 = [BTAVRCP_AlbumsFolder alloc];
      v11 = [(BTAVRCP_MyMusicFolder *)self folderNameForUid:2];
      id v12 = v16;
      v13 = v11;
      uint64_t v14 = 2;
      goto LABEL_9;
    case 3uLL:
      v17 = [BTAVRCP_SongsFolder alloc];
      v11 = [(BTAVRCP_MyMusicFolder *)self folderNameForUid:3];
      id v12 = v17;
      v13 = v11;
      uint64_t v14 = 3;
      goto LABEL_9;
    case 4uLL:
      v18 = [BTAVRCP_GenresFolder alloc];
      v11 = [(BTAVRCP_MyMusicFolder *)self folderNameForUid:4];
      id v12 = v18;
      v13 = v11;
      uint64_t v14 = 4;
      goto LABEL_9;
    case 5uLL:
      v19 = [BTAVRCP_ComposersFolder alloc];
      v11 = [(BTAVRCP_MyMusicFolder *)self folderNameForUid:5];
      id v12 = v19;
      v13 = v11;
      uint64_t v14 = 5;
LABEL_9:
      *a4 = [v12 initWithName:v13 uid:v14];
      goto LABEL_10;
    case 6uLL:
      v20 = [BTAVRCP_AlbumsFolder alloc];
      v21 = [(BTAVRCP_MyMusicFolder *)self folderNameForUid:6];
      *a4 = [(BTAVRCP_AlbumsFolder *)v20 initWithName:v21 uid:6];

      id v22 = *a4;
      v11 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:MPMediaItemPropertyIsCompilation];
      [v22 storePredicate:v11];
LABEL_10:

      break;
    default:
      return 4;
  }
  return 4;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  CFStringRef v6 = [(BTAVRCP_MyMusicFolder *)self activeCategories];
  id v7 = [v6 count];

  if ((unint64_t)v7 <= a3)
  {
    uint64_t v14 = 0;
  }
  else
  {
    unsigned __int8 v8 = [(BTAVRCP_MyMusicFolder *)self activeCategories];
    unsigned int v9 = [v8 objectAtIndexedSubscript:a3];
    id v10 = [v9 unsignedLongLongValue];

    uint64_t v11 = [(BTAVRCP_MyMusicFolder *)self folderTypeForUid:v10];
    id v12 = +[NSNumber numberWithUnsignedLongLong:v10];
    v13 = [(BTAVRCP_MyMusicFolder *)self folderNameForUid:v10];
    uint64_t v14 = [(BTAVRCP_VFSFolder *)self replyFolderWithType:v11 uid:v12 name:v13];
  }

  return v14;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  unsigned int v5 = [(BTAVRCP_MyMusicFolder *)self activeCategories];
  CFStringRef v6 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned int v7 = [v5 containsObject:v6];

  if (v7) {
    return &__NSDictionary0__struct;
  }
  else {
    return 0;
  }
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  objc_super v4 = [(BTAVRCP_MyMusicFolder *)self activeCategories];
  unsigned int v5 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned int v6 = [v4 containsObject:v5];

  if (v6) {
    return 12;
  }
  else {
    return 9;
  }
}

- (NSArray)activeCategories
{
  return self->_activeCategories;
}

- (void)setActiveCategories:(id)a3
{
}

- (void).cxx_destruct
{
}

@end