@interface MIPPlaylist
+ (Class)childIdentifiersType;
+ (Class)itemsType;
- (BOOL)cloudIsCuratorPlaylist;
- (BOOL)cloudIsSharingDisabled;
- (BOOL)cloudIsSubscribed;
- (BOOL)collaborationJoinRequestPending;
- (BOOL)editable;
- (BOOL)externalVendorPlaylist;
- (BOOL)hasArtworkId;
- (BOOL)hasAuthorDisplayName;
- (BOOL)hasAuthorHandle;
- (BOOL)hasAuthorStoreId;
- (BOOL)hasAuthorStoreURL;
- (BOOL)hasCloudGlobalId;
- (BOOL)hasCloudIsCuratorPlaylist;
- (BOOL)hasCloudIsSharingDisabled;
- (BOOL)hasCloudIsSubscribed;
- (BOOL)hasCloudLastUpdateTime;
- (BOOL)hasCloudUniversalLibraryId;
- (BOOL)hasCloudVersionHash;
- (BOOL)hasCollaborationInvitationURL;
- (BOOL)hasCollaborationInvitationURLExpirationDate;
- (BOOL)hasCollaborationJoinRequestPending;
- (BOOL)hasCollaborationMode;
- (BOOL)hasCollaboratorStatus;
- (BOOL)hasCoverArtworkRecipe;
- (BOOL)hasCreationDateTime;
- (BOOL)hasDistinguishedKind;
- (BOOL)hasEditable;
- (BOOL)hasExternalVendorDisplayName;
- (BOOL)hasExternalVendorIdentifier;
- (BOOL)hasExternalVendorPlaylist;
- (BOOL)hasExternalVendorTag;
- (BOOL)hasGeniusSeedTrackIdentifier;
- (BOOL)hasHidden;
- (BOOL)hasIsCollaborative;
- (BOOL)hasLastPlayedDateTime;
- (BOOL)hasLikedState;
- (BOOL)hasLikedStateChangedDate;
- (BOOL)hasMinRefreshInterval;
- (BOOL)hasModificationDateTime;
- (BOOL)hasName;
- (BOOL)hasOwner;
- (BOOL)hasParentIdentifier;
- (BOOL)hasPlayCount;
- (BOOL)hasPlaylistCategoryTypeMask;
- (BOOL)hasPlaylistDescription;
- (BOOL)hasPlaylistGroupingSortKey;
- (BOOL)hasRemoteSourceType;
- (BOOL)hasReversedSorting;
- (BOOL)hasSecondaryArtworkId;
- (BOOL)hasSecondaryArtworkSourceType;
- (BOOL)hasShared;
- (BOOL)hasSmartPlaylistInfo;
- (BOOL)hasSortType;
- (BOOL)hasStoreId;
- (BOOL)hasSubscriberCount;
- (BOOL)hasSubscriberLikedCount;
- (BOOL)hasSubscriberPlayCount;
- (BOOL)hasSubscriberURL;
- (BOOL)hasTraits;
- (BOOL)hasType;
- (BOOL)hasVisible;
- (BOOL)hidden;
- (BOOL)isCollaborative;
- (BOOL)isEqual:(id)a3;
- (BOOL)owner;
- (BOOL)readFrom:(id)a3;
- (BOOL)reversedSorting;
- (BOOL)shared;
- (BOOL)visible;
- (MIPMultiverseIdentifier)geniusSeedTrackIdentifier;
- (MIPMultiverseIdentifier)parentIdentifier;
- (MIPSmartPlaylistInfo)smartPlaylistInfo;
- (NSMutableArray)childIdentifiers;
- (NSMutableArray)items;
- (NSString)artworkId;
- (NSString)authorDisplayName;
- (NSString)authorHandle;
- (NSString)authorStoreURL;
- (NSString)cloudGlobalId;
- (NSString)cloudUniversalLibraryId;
- (NSString)cloudVersionHash;
- (NSString)collaborationInvitationURL;
- (NSString)coverArtworkRecipe;
- (NSString)externalVendorDisplayName;
- (NSString)externalVendorIdentifier;
- (NSString)externalVendorTag;
- (NSString)name;
- (NSString)playlistDescription;
- (NSString)playlistGroupingSortKey;
- (NSString)secondaryArtworkId;
- (NSString)subscriberURL;
- (id)childIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)itemsAtIndex:(unint64_t)a3;
- (id)sortTypeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsSortType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)collaborationMode;
- (int)collaboratorStatus;
- (int)distinguishedKind;
- (int)likedState;
- (int)playCount;
- (int)playlistCategoryTypeMask;
- (int)remoteSourceType;
- (int)secondaryArtworkSourceType;
- (int)sortType;
- (int)subscriberCount;
- (int)subscriberLikedCount;
- (int)subscriberPlayCount;
- (int)traits;
- (int)type;
- (int64_t)authorStoreId;
- (int64_t)cloudLastUpdateTime;
- (int64_t)collaborationInvitationURLExpirationDate;
- (int64_t)creationDateTime;
- (int64_t)lastPlayedDateTime;
- (int64_t)likedStateChangedDate;
- (int64_t)minRefreshInterval;
- (int64_t)modificationDateTime;
- (int64_t)storeId;
- (unint64_t)childIdentifiersCount;
- (unint64_t)hash;
- (unint64_t)itemsCount;
- (void)addChildIdentifiers:(id)a3;
- (void)addItems:(id)a3;
- (void)clearChildIdentifiers;
- (void)clearItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtworkId:(id)a3;
- (void)setAuthorDisplayName:(id)a3;
- (void)setAuthorHandle:(id)a3;
- (void)setAuthorStoreId:(int64_t)a3;
- (void)setAuthorStoreURL:(id)a3;
- (void)setChildIdentifiers:(id)a3;
- (void)setCloudGlobalId:(id)a3;
- (void)setCloudIsCuratorPlaylist:(BOOL)a3;
- (void)setCloudIsSharingDisabled:(BOOL)a3;
- (void)setCloudIsSubscribed:(BOOL)a3;
- (void)setCloudLastUpdateTime:(int64_t)a3;
- (void)setCloudUniversalLibraryId:(id)a3;
- (void)setCloudVersionHash:(id)a3;
- (void)setCollaborationInvitationURL:(id)a3;
- (void)setCollaborationInvitationURLExpirationDate:(int64_t)a3;
- (void)setCollaborationJoinRequestPending:(BOOL)a3;
- (void)setCollaborationMode:(int)a3;
- (void)setCollaboratorStatus:(int)a3;
- (void)setCoverArtworkRecipe:(id)a3;
- (void)setCreationDateTime:(int64_t)a3;
- (void)setDistinguishedKind:(int)a3;
- (void)setEditable:(BOOL)a3;
- (void)setExternalVendorDisplayName:(id)a3;
- (void)setExternalVendorIdentifier:(id)a3;
- (void)setExternalVendorPlaylist:(BOOL)a3;
- (void)setExternalVendorTag:(id)a3;
- (void)setGeniusSeedTrackIdentifier:(id)a3;
- (void)setHasAuthorStoreId:(BOOL)a3;
- (void)setHasCloudIsCuratorPlaylist:(BOOL)a3;
- (void)setHasCloudIsSharingDisabled:(BOOL)a3;
- (void)setHasCloudIsSubscribed:(BOOL)a3;
- (void)setHasCloudLastUpdateTime:(BOOL)a3;
- (void)setHasCollaborationInvitationURLExpirationDate:(BOOL)a3;
- (void)setHasCollaborationJoinRequestPending:(BOOL)a3;
- (void)setHasCollaborationMode:(BOOL)a3;
- (void)setHasCollaboratorStatus:(BOOL)a3;
- (void)setHasCreationDateTime:(BOOL)a3;
- (void)setHasDistinguishedKind:(BOOL)a3;
- (void)setHasEditable:(BOOL)a3;
- (void)setHasExternalVendorPlaylist:(BOOL)a3;
- (void)setHasHidden:(BOOL)a3;
- (void)setHasIsCollaborative:(BOOL)a3;
- (void)setHasLastPlayedDateTime:(BOOL)a3;
- (void)setHasLikedState:(BOOL)a3;
- (void)setHasLikedStateChangedDate:(BOOL)a3;
- (void)setHasMinRefreshInterval:(BOOL)a3;
- (void)setHasModificationDateTime:(BOOL)a3;
- (void)setHasOwner:(BOOL)a3;
- (void)setHasPlayCount:(BOOL)a3;
- (void)setHasPlaylistCategoryTypeMask:(BOOL)a3;
- (void)setHasRemoteSourceType:(BOOL)a3;
- (void)setHasReversedSorting:(BOOL)a3;
- (void)setHasSecondaryArtworkSourceType:(BOOL)a3;
- (void)setHasShared:(BOOL)a3;
- (void)setHasSortType:(BOOL)a3;
- (void)setHasStoreId:(BOOL)a3;
- (void)setHasSubscriberCount:(BOOL)a3;
- (void)setHasSubscriberLikedCount:(BOOL)a3;
- (void)setHasSubscriberPlayCount:(BOOL)a3;
- (void)setHasTraits:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVisible:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsCollaborative:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setLastPlayedDateTime:(int64_t)a3;
- (void)setLikedState:(int)a3;
- (void)setLikedStateChangedDate:(int64_t)a3;
- (void)setMinRefreshInterval:(int64_t)a3;
- (void)setModificationDateTime:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setOwner:(BOOL)a3;
- (void)setParentIdentifier:(id)a3;
- (void)setPlayCount:(int)a3;
- (void)setPlaylistCategoryTypeMask:(int)a3;
- (void)setPlaylistDescription:(id)a3;
- (void)setPlaylistGroupingSortKey:(id)a3;
- (void)setRemoteSourceType:(int)a3;
- (void)setReversedSorting:(BOOL)a3;
- (void)setSecondaryArtworkId:(id)a3;
- (void)setSecondaryArtworkSourceType:(int)a3;
- (void)setShared:(BOOL)a3;
- (void)setSmartPlaylistInfo:(id)a3;
- (void)setSortType:(int)a3;
- (void)setStoreId:(int64_t)a3;
- (void)setSubscriberCount:(int)a3;
- (void)setSubscriberLikedCount:(int)a3;
- (void)setSubscriberPlayCount:(int)a3;
- (void)setSubscriberURL:(id)a3;
- (void)setTraits:(int)a3;
- (void)setType:(int)a3;
- (void)setVisible:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MIPPlaylist

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriberURL, 0);
  objc_storeStrong((id *)&self->_smartPlaylistInfo, 0);
  objc_storeStrong((id *)&self->_secondaryArtworkId, 0);
  objc_storeStrong((id *)&self->_playlistGroupingSortKey, 0);
  objc_storeStrong((id *)&self->_playlistDescription, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_geniusSeedTrackIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVendorTag, 0);
  objc_storeStrong((id *)&self->_externalVendorIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVendorDisplayName, 0);
  objc_storeStrong((id *)&self->_coverArtworkRecipe, 0);
  objc_storeStrong((id *)&self->_collaborationInvitationURL, 0);
  objc_storeStrong((id *)&self->_cloudVersionHash, 0);
  objc_storeStrong((id *)&self->_cloudUniversalLibraryId, 0);
  objc_storeStrong((id *)&self->_cloudGlobalId, 0);
  objc_storeStrong((id *)&self->_childIdentifiers, 0);
  objc_storeStrong((id *)&self->_authorStoreURL, 0);
  objc_storeStrong((id *)&self->_authorHandle, 0);
  objc_storeStrong((id *)&self->_authorDisplayName, 0);

  objc_storeStrong((id *)&self->_artworkId, 0);
}

- (void)setItems:(id)a3
{
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setChildIdentifiers:(id)a3
{
}

- (NSMutableArray)childIdentifiers
{
  return self->_childIdentifiers;
}

- (int)collaboratorStatus
{
  return self->_collaboratorStatus;
}

- (BOOL)collaborationJoinRequestPending
{
  return self->_collaborationJoinRequestPending;
}

- (int64_t)collaborationInvitationURLExpirationDate
{
  return self->_collaborationInvitationURLExpirationDate;
}

- (void)setCollaborationInvitationURL:(id)a3
{
}

- (NSString)collaborationInvitationURL
{
  return self->_collaborationInvitationURL;
}

- (int)collaborationMode
{
  return self->_collaborationMode;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setCoverArtworkRecipe:(id)a3
{
}

- (NSString)coverArtworkRecipe
{
  return self->_coverArtworkRecipe;
}

- (int)traits
{
  return self->_traits;
}

- (int64_t)likedStateChangedDate
{
  return self->_likedStateChangedDate;
}

- (void)setPlaylistGroupingSortKey:(id)a3
{
}

- (NSString)playlistGroupingSortKey
{
  return self->_playlistGroupingSortKey;
}

- (int)playlistCategoryTypeMask
{
  return self->_playlistCategoryTypeMask;
}

- (void)setSecondaryArtworkId:(id)a3
{
}

- (NSString)secondaryArtworkId
{
  return self->_secondaryArtworkId;
}

- (int)secondaryArtworkSourceType
{
  return self->_secondaryArtworkSourceType;
}

- (void)setCloudUniversalLibraryId:(id)a3
{
}

- (NSString)cloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId;
}

- (void)setPlaylistDescription:(id)a3
{
}

- (NSString)playlistDescription
{
  return self->_playlistDescription;
}

- (void)setSubscriberURL:(id)a3
{
}

- (NSString)subscriberURL
{
  return self->_subscriberURL;
}

- (int)subscriberLikedCount
{
  return self->_subscriberLikedCount;
}

- (int)subscriberPlayCount
{
  return self->_subscriberPlayCount;
}

- (int)subscriberCount
{
  return self->_subscriberCount;
}

- (int64_t)cloudLastUpdateTime
{
  return self->_cloudLastUpdateTime;
}

- (int64_t)minRefreshInterval
{
  return self->_minRefreshInterval;
}

- (void)setAuthorHandle:(id)a3
{
}

- (NSString)authorHandle
{
  return self->_authorHandle;
}

- (void)setAuthorStoreURL:(id)a3
{
}

- (NSString)authorStoreURL
{
  return self->_authorStoreURL;
}

- (void)setAuthorDisplayName:(id)a3
{
}

- (NSString)authorDisplayName
{
  return self->_authorDisplayName;
}

- (int64_t)authorStoreId
{
  return self->_authorStoreId;
}

- (BOOL)visible
{
  return self->_visible;
}

- (BOOL)shared
{
  return self->_shared;
}

- (int)playCount
{
  return self->_playCount;
}

- (BOOL)editable
{
  return self->_editable;
}

- (BOOL)owner
{
  return self->_owner;
}

- (int)remoteSourceType
{
  return self->_remoteSourceType;
}

- (int)likedState
{
  return self->_likedState;
}

- (void)setArtworkId:(id)a3
{
}

- (NSString)artworkId
{
  return self->_artworkId;
}

- (void)setCloudVersionHash:(id)a3
{
}

- (NSString)cloudVersionHash
{
  return self->_cloudVersionHash;
}

- (BOOL)cloudIsSharingDisabled
{
  return self->_cloudIsSharingDisabled;
}

- (int64_t)lastPlayedDateTime
{
  return self->_lastPlayedDateTime;
}

- (int64_t)modificationDateTime
{
  return self->_modificationDateTime;
}

- (int64_t)creationDateTime
{
  return self->_creationDateTime;
}

- (BOOL)externalVendorPlaylist
{
  return self->_externalVendorPlaylist;
}

- (void)setExternalVendorTag:(id)a3
{
}

- (NSString)externalVendorTag
{
  return self->_externalVendorTag;
}

- (void)setExternalVendorDisplayName:(id)a3
{
}

- (NSString)externalVendorDisplayName
{
  return self->_externalVendorDisplayName;
}

- (void)setExternalVendorIdentifier:(id)a3
{
}

- (NSString)externalVendorIdentifier
{
  return self->_externalVendorIdentifier;
}

- (BOOL)cloudIsCuratorPlaylist
{
  return self->_cloudIsCuratorPlaylist;
}

- (BOOL)cloudIsSubscribed
{
  return self->_cloudIsSubscribed;
}

- (void)setCloudGlobalId:(id)a3
{
}

- (NSString)cloudGlobalId
{
  return self->_cloudGlobalId;
}

- (int)distinguishedKind
{
  return self->_distinguishedKind;
}

- (void)setGeniusSeedTrackIdentifier:(id)a3
{
}

- (MIPMultiverseIdentifier)geniusSeedTrackIdentifier
{
  return self->_geniusSeedTrackIdentifier;
}

- (void)setParentIdentifier:(id)a3
{
}

- (MIPMultiverseIdentifier)parentIdentifier
{
  return self->_parentIdentifier;
}

- (BOOL)reversedSorting
{
  return self->_reversedSorting;
}

- (void)setSmartPlaylistInfo:(id)a3
{
}

- (MIPSmartPlaylistInfo)smartPlaylistInfo
{
  return self->_smartPlaylistInfo;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (int64_t)storeId
{
  return self->_storeId;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v4 = (char *)a3;
  if (*((void *)v4 + 28)) {
    -[MIPPlaylist setName:](self, "setName:");
  }
  uint64_t v5 = *(void *)(v4 + 340);
  if ((v5 & 0x100) != 0)
  {
    self->_storeId = *((void *)v4 + 9);
    *(void *)&self->_has |= 0x100uLL;
    uint64_t v5 = *(void *)(v4 + 340);
    if ((v5 & 0x400000) == 0)
    {
LABEL_5:
      if ((v5 & 0x20000000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((v5 & 0x400000) == 0)
  {
    goto LABEL_5;
  }
  self->_type = *((_DWORD *)v4 + 81);
  *(void *)&self->_has |= 0x400000uLL;
  if ((*(void *)(v4 + 340) & 0x20000000) != 0)
  {
LABEL_6:
    self->_hidden = v4[334];
    *(void *)&self->_has |= 0x20000000uLL;
  }
LABEL_7:
  smartPlaylistInfo = self->_smartPlaylistInfo;
  uint64_t v7 = *((void *)v4 + 36);
  if (smartPlaylistInfo)
  {
    if (v7) {
      -[MIPSmartPlaylistInfo mergeFrom:](smartPlaylistInfo, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[MIPPlaylist setSmartPlaylistInfo:](self, "setSmartPlaylistInfo:");
  }
  uint64_t v8 = *(void *)(v4 + 340);
  if ((v8 & 0x20000) != 0)
  {
    self->_sortType = *((_DWORD *)v4 + 74);
    *(void *)&self->_has |= 0x20000uLL;
    uint64_t v8 = *(void *)(v4 + 340);
  }
  if ((v8 & 0x100000000) != 0)
  {
    self->_reversedSorting = v4[337];
    *(void *)&self->_has |= 0x100000000uLL;
  }
  parentIdentifier = self->_parentIdentifier;
  uint64_t v10 = *((void *)v4 + 29);
  if (parentIdentifier)
  {
    if (v10) {
      -[MIPMultiverseIdentifier mergeFrom:](parentIdentifier, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[MIPPlaylist setParentIdentifier:](self, "setParentIdentifier:");
  }
  geniusSeedTrackIdentifier = self->_geniusSeedTrackIdentifier;
  uint64_t v12 = *((void *)v4 + 25);
  if (geniusSeedTrackIdentifier)
  {
    if (v12) {
      -[MIPMultiverseIdentifier mergeFrom:](geniusSeedTrackIdentifier, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[MIPPlaylist setGeniusSeedTrackIdentifier:](self, "setGeniusSeedTrackIdentifier:");
  }
  if ((v4[341] & 8) != 0)
  {
    self->_distinguishedKind = *((_DWORD *)v4 + 42);
    *(void *)&self->_has |= 0x800uLL;
  }
  if (*((void *)v4 + 15)) {
    -[MIPPlaylist setCloudGlobalId:](self, "setCloudGlobalId:");
  }
  uint64_t v13 = *(void *)(v4 + 340);
  if ((v13 & 0x2000000) != 0)
  {
    self->_cloudIsSubscribed = v4[330];
    *(void *)&self->_has |= 0x2000000uLL;
    uint64_t v13 = *(void *)(v4 + 340);
  }
  if ((v13 & 0x800000) != 0)
  {
    self->_cloudIsCuratorPlaylist = v4[328];
    *(void *)&self->_has |= 0x800000uLL;
  }
  if (*((void *)v4 + 23)) {
    -[MIPPlaylist setExternalVendorIdentifier:](self, "setExternalVendorIdentifier:");
  }
  if (*((void *)v4 + 22)) {
    -[MIPPlaylist setExternalVendorDisplayName:](self, "setExternalVendorDisplayName:");
  }
  if (*((void *)v4 + 24)) {
    -[MIPPlaylist setExternalVendorTag:](self, "setExternalVendorTag:");
  }
  uint64_t v14 = *(void *)(v4 + 340);
  if ((v14 & 0x10000000) != 0)
  {
    self->_externalVendorPlaylist = v4[333];
    *(void *)&self->_has |= 0x10000000uLL;
    uint64_t v14 = *(void *)(v4 + 340);
    if ((v14 & 8) == 0)
    {
LABEL_45:
      if ((v14 & 0x80) == 0) {
        goto LABEL_46;
      }
      goto LABEL_121;
    }
  }
  else if ((v14 & 8) == 0)
  {
    goto LABEL_45;
  }
  self->_creationDateTime = *((void *)v4 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v14 = *(void *)(v4 + 340);
  if ((v14 & 0x80) == 0)
  {
LABEL_46:
    if ((v14 & 0x10) == 0) {
      goto LABEL_47;
    }
    goto LABEL_122;
  }
LABEL_121:
  self->_modificationDateTime = *((void *)v4 + 8);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v14 = *(void *)(v4 + 340);
  if ((v14 & 0x10) == 0)
  {
LABEL_47:
    if ((v14 & 0x1000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_122:
  self->_lastPlayedDateTime = *((void *)v4 + 5);
  *(void *)&self->_has |= 0x10uLL;
  if ((*(void *)(v4 + 340) & 0x1000000) != 0)
  {
LABEL_48:
    self->_cloudIsSharingDisabled = v4[329];
    *(void *)&self->_has |= 0x1000000uLL;
  }
LABEL_49:
  if (*((void *)v4 + 17)) {
    -[MIPPlaylist setCloudVersionHash:](self, "setCloudVersionHash:");
  }
  if (*((void *)v4 + 10)) {
    -[MIPPlaylist setArtworkId:](self, "setArtworkId:");
  }
  uint64_t v15 = *(void *)(v4 + 340);
  if ((v15 & 0x1000) != 0)
  {
    self->_likedState = *((_DWORD *)v4 + 54);
    *(void *)&self->_has |= 0x1000uLL;
    uint64_t v15 = *(void *)(v4 + 340);
    if ((v15 & 0x8000) == 0)
    {
LABEL_55:
      if ((v15 & 0x80000000) == 0) {
        goto LABEL_56;
      }
      goto LABEL_126;
    }
  }
  else if ((v15 & 0x8000) == 0)
  {
    goto LABEL_55;
  }
  self->_remoteSourceType = *((_DWORD *)v4 + 66);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v15 = *(void *)(v4 + 340);
  if ((v15 & 0x80000000) == 0)
  {
LABEL_56:
    if ((v15 & 0x8000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_127;
  }
LABEL_126:
  self->_owner = v4[336];
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v15 = *(void *)(v4 + 340);
  if ((v15 & 0x8000000) == 0)
  {
LABEL_57:
    if ((v15 & 0x2000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_128;
  }
LABEL_127:
  self->_editable = v4[332];
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v15 = *(void *)(v4 + 340);
  if ((v15 & 0x2000) == 0)
  {
LABEL_58:
    if ((v15 & 0x200000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_129;
  }
LABEL_128:
  self->_playCount = *((_DWORD *)v4 + 60);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v15 = *(void *)(v4 + 340);
  if ((v15 & 0x200000000) == 0)
  {
LABEL_59:
    if ((v15 & 0x400000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_130;
  }
LABEL_129:
  self->_shared = v4[338];
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v15 = *(void *)(v4 + 340);
  if ((v15 & 0x400000000) == 0)
  {
LABEL_60:
    if ((v15 & 1) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_130:
  self->_visible = v4[339];
  *(void *)&self->_has |= 0x400000000uLL;
  if (*(void *)(v4 + 340))
  {
LABEL_61:
    self->_authorStoreId = *((void *)v4 + 1);
    *(void *)&self->_has |= 1uLL;
  }
LABEL_62:
  if (*((void *)v4 + 11)) {
    -[MIPPlaylist setAuthorDisplayName:](self, "setAuthorDisplayName:");
  }
  if (*((void *)v4 + 13)) {
    -[MIPPlaylist setAuthorStoreURL:](self, "setAuthorStoreURL:");
  }
  if (*((void *)v4 + 12)) {
    -[MIPPlaylist setAuthorHandle:](self, "setAuthorHandle:");
  }
  uint64_t v16 = *(void *)(v4 + 340);
  if ((v16 & 0x40) != 0)
  {
    self->_minRefreshInterval = *((void *)v4 + 7);
    *(void *)&self->_has |= 0x40uLL;
    uint64_t v16 = *(void *)(v4 + 340);
    if ((v16 & 2) == 0)
    {
LABEL_70:
      if ((v16 & 0x40000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_134;
    }
  }
  else if ((v16 & 2) == 0)
  {
    goto LABEL_70;
  }
  self->_cloudLastUpdateTime = *((void *)v4 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v16 = *(void *)(v4 + 340);
  if ((v16 & 0x40000) == 0)
  {
LABEL_71:
    if ((v16 & 0x100000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_135;
  }
LABEL_134:
  self->_subscriberCount = *((_DWORD *)v4 + 75);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v16 = *(void *)(v4 + 340);
  if ((v16 & 0x100000) == 0)
  {
LABEL_72:
    if ((v16 & 0x80000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
LABEL_135:
  self->_subscriberPlayCount = *((_DWORD *)v4 + 77);
  *(void *)&self->_has |= 0x100000uLL;
  if ((*(void *)(v4 + 340) & 0x80000) != 0)
  {
LABEL_73:
    self->_subscriberLikedCount = *((_DWORD *)v4 + 76);
    *(void *)&self->_has |= 0x80000uLL;
  }
LABEL_74:
  if (*((void *)v4 + 39)) {
    -[MIPPlaylist setSubscriberURL:](self, "setSubscriberURL:");
  }
  if (*((void *)v4 + 31)) {
    -[MIPPlaylist setPlaylistDescription:](self, "setPlaylistDescription:");
  }
  if (*((void *)v4 + 16)) {
    -[MIPPlaylist setCloudUniversalLibraryId:](self, "setCloudUniversalLibraryId:");
  }
  if (v4[342])
  {
    self->_secondaryArtworkSourceType = *((_DWORD *)v4 + 70);
    *(void *)&self->_has |= 0x10000uLL;
  }
  if (*((void *)v4 + 34)) {
    -[MIPPlaylist setSecondaryArtworkId:](self, "setSecondaryArtworkId:");
  }
  if ((v4[341] & 0x40) != 0)
  {
    self->_playlistCategoryTypeMask = *((_DWORD *)v4 + 61);
    *(void *)&self->_has |= 0x4000uLL;
  }
  if (*((void *)v4 + 32)) {
    -[MIPPlaylist setPlaylistGroupingSortKey:](self, "setPlaylistGroupingSortKey:");
  }
  uint64_t v17 = *(void *)(v4 + 340);
  if ((v17 & 0x20) != 0)
  {
    self->_likedStateChangedDate = *((void *)v4 + 6);
    *(void *)&self->_has |= 0x20uLL;
    uint64_t v17 = *(void *)(v4 + 340);
  }
  if ((v17 & 0x200000) != 0)
  {
    self->_traits = *((_DWORD *)v4 + 80);
    *(void *)&self->_has |= 0x200000uLL;
  }
  if (*((void *)v4 + 20)) {
    -[MIPPlaylist setCoverArtworkRecipe:](self, "setCoverArtworkRecipe:");
  }
  uint64_t v18 = *(void *)(v4 + 340);
  if ((v18 & 0x40000000) != 0)
  {
    self->_isCollaborative = v4[335];
    *(void *)&self->_has |= 0x40000000uLL;
    uint64_t v18 = *(void *)(v4 + 340);
  }
  if ((v18 & 0x200) != 0)
  {
    self->_collaborationMode = *((_DWORD *)v4 + 38);
    *(void *)&self->_has |= 0x200uLL;
  }
  if (*((void *)v4 + 18)) {
    -[MIPPlaylist setCollaborationInvitationURL:](self, "setCollaborationInvitationURL:");
  }
  uint64_t v19 = *(void *)(v4 + 340);
  if ((v19 & 4) != 0)
  {
    self->_collaborationInvitationURLExpirationDate = *((void *)v4 + 3);
    *(void *)&self->_has |= 4uLL;
    uint64_t v19 = *(void *)(v4 + 340);
    if ((v19 & 0x4000000) == 0)
    {
LABEL_102:
      if ((v19 & 0x400) == 0) {
        goto LABEL_104;
      }
      goto LABEL_103;
    }
  }
  else if ((v19 & 0x4000000) == 0)
  {
    goto LABEL_102;
  }
  self->_collaborationJoinRequestPending = v4[331];
  *(void *)&self->_has |= 0x4000000uLL;
  if ((*(void *)(v4 + 340) & 0x400) != 0)
  {
LABEL_103:
    self->_collaboratorStatus = *((_DWORD *)v4 + 39);
    *(void *)&self->_has |= 0x400uLL;
  }
LABEL_104:
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v20 = *((id *)v4 + 14);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        [(MIPPlaylist *)self addChildIdentifiers:*(void *)(*((void *)&v34 + 1) + 8 * i)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v22);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v25 = *((id *)v4 + 26);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        -[MIPPlaylist addItems:](self, "addItems:", *(void *)(*((void *)&v30 + 1) + 8 * j), (void)v30);
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v27);
  }
}

- (unint64_t)hash
{
  NSUInteger v68 = [(NSString *)self->_name hash];
  $043343F9A094FB3D6889D8E028CD7DF8 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
    uint64_t v67 = 0;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v66 = 0;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v67 = 2654435761 * self->_storeId;
  if ((*(_DWORD *)&has & 0x400000) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v66 = 2654435761 * self->_type;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_4:
    uint64_t v65 = 2654435761 * self->_hidden;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v65 = 0;
LABEL_8:
  unint64_t v64 = [(MIPSmartPlaylistInfo *)self->_smartPlaylistInfo hash];
  $043343F9A094FB3D6889D8E028CD7DF8 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
    uint64_t v63 = 2654435761 * self->_sortType;
    if ((*(void *)&v4 & 0x100000000) != 0) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v63 = 0;
    if ((*(void *)&v4 & 0x100000000) != 0)
    {
LABEL_10:
      uint64_t v62 = 2654435761 * self->_reversedSorting;
      goto LABEL_13;
    }
  }
  uint64_t v62 = 0;
LABEL_13:
  unint64_t v61 = [(MIPMultiverseIdentifier *)self->_parentIdentifier hash];
  unint64_t v60 = [(MIPMultiverseIdentifier *)self->_geniusSeedTrackIdentifier hash];
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    uint64_t v59 = 2654435761 * self->_distinguishedKind;
  }
  else {
    uint64_t v59 = 0;
  }
  NSUInteger v58 = [(NSString *)self->_cloudGlobalId hash];
  $043343F9A094FB3D6889D8E028CD7DF8 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x2000000) != 0)
  {
    uint64_t v57 = 2654435761 * self->_cloudIsSubscribed;
    if ((*(_DWORD *)&v5 & 0x800000) != 0) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v57 = 0;
    if ((*(_DWORD *)&v5 & 0x800000) != 0)
    {
LABEL_18:
      uint64_t v56 = 2654435761 * self->_cloudIsCuratorPlaylist;
      goto LABEL_21;
    }
  }
  uint64_t v56 = 0;
LABEL_21:
  NSUInteger v55 = [(NSString *)self->_externalVendorIdentifier hash];
  NSUInteger v54 = [(NSString *)self->_externalVendorDisplayName hash];
  NSUInteger v53 = [(NSString *)self->_externalVendorTag hash];
  $043343F9A094FB3D6889D8E028CD7DF8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000000) != 0)
  {
    uint64_t v52 = 2654435761 * self->_externalVendorPlaylist;
    if ((*(unsigned char *)&v6 & 8) != 0)
    {
LABEL_23:
      uint64_t v51 = 2654435761 * self->_creationDateTime;
      if ((*(unsigned char *)&v6 & 0x80) != 0) {
        goto LABEL_24;
      }
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v52 = 0;
    if ((*(unsigned char *)&v6 & 8) != 0) {
      goto LABEL_23;
    }
  }
  uint64_t v51 = 0;
  if ((*(unsigned char *)&v6 & 0x80) != 0)
  {
LABEL_24:
    uint64_t v50 = 2654435761 * self->_modificationDateTime;
    if ((*(unsigned char *)&v6 & 0x10) != 0) {
      goto LABEL_25;
    }
LABEL_30:
    uint64_t v49 = 0;
    if ((*(_DWORD *)&v6 & 0x1000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_31;
  }
LABEL_29:
  uint64_t v50 = 0;
  if ((*(unsigned char *)&v6 & 0x10) == 0) {
    goto LABEL_30;
  }
LABEL_25:
  uint64_t v49 = 2654435761 * self->_lastPlayedDateTime;
  if ((*(_DWORD *)&v6 & 0x1000000) != 0)
  {
LABEL_26:
    uint64_t v48 = 2654435761 * self->_cloudIsSharingDisabled;
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v48 = 0;
LABEL_32:
  NSUInteger v47 = [(NSString *)self->_cloudVersionHash hash];
  NSUInteger v46 = [(NSString *)self->_artworkId hash];
  $043343F9A094FB3D6889D8E028CD7DF8 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x1000) != 0)
  {
    uint64_t v45 = 2654435761 * self->_likedState;
    if ((*(_WORD *)&v7 & 0x8000) != 0)
    {
LABEL_34:
      uint64_t v44 = 2654435761 * self->_remoteSourceType;
      if ((*(_DWORD *)&v7 & 0x80000000) != 0) {
        goto LABEL_35;
      }
      goto LABEL_43;
    }
  }
  else
  {
    uint64_t v45 = 0;
    if ((*(_WORD *)&v7 & 0x8000) != 0) {
      goto LABEL_34;
    }
  }
  uint64_t v44 = 0;
  if ((*(_DWORD *)&v7 & 0x80000000) != 0)
  {
LABEL_35:
    uint64_t v43 = 2654435761 * self->_owner;
    if ((*(_DWORD *)&v7 & 0x8000000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v43 = 0;
  if ((*(_DWORD *)&v7 & 0x8000000) != 0)
  {
LABEL_36:
    uint64_t v42 = 2654435761 * self->_editable;
    if ((*(_WORD *)&v7 & 0x2000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v42 = 0;
  if ((*(_WORD *)&v7 & 0x2000) != 0)
  {
LABEL_37:
    uint64_t v41 = 2654435761 * self->_playCount;
    if ((*(void *)&v7 & 0x200000000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v41 = 0;
  if ((*(void *)&v7 & 0x200000000) != 0)
  {
LABEL_38:
    uint64_t v40 = 2654435761 * self->_shared;
    if ((*(void *)&v7 & 0x400000000) != 0) {
      goto LABEL_39;
    }
LABEL_47:
    uint64_t v39 = 0;
    if (*(unsigned char *)&v7) {
      goto LABEL_40;
    }
    goto LABEL_48;
  }
LABEL_46:
  uint64_t v40 = 0;
  if ((*(void *)&v7 & 0x400000000) == 0) {
    goto LABEL_47;
  }
LABEL_39:
  uint64_t v39 = 2654435761 * self->_visible;
  if (*(unsigned char *)&v7)
  {
LABEL_40:
    uint64_t v38 = 2654435761 * self->_authorStoreId;
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v38 = 0;
LABEL_49:
  NSUInteger v37 = [(NSString *)self->_authorDisplayName hash];
  NSUInteger v36 = [(NSString *)self->_authorStoreURL hash];
  NSUInteger v35 = [(NSString *)self->_authorHandle hash];
  $043343F9A094FB3D6889D8E028CD7DF8 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x40) != 0)
  {
    uint64_t v34 = 2654435761 * self->_minRefreshInterval;
    if ((*(unsigned char *)&v8 & 2) != 0)
    {
LABEL_51:
      uint64_t v33 = 2654435761 * self->_cloudLastUpdateTime;
      if ((*(_DWORD *)&v8 & 0x40000) != 0) {
        goto LABEL_52;
      }
      goto LABEL_57;
    }
  }
  else
  {
    uint64_t v34 = 0;
    if ((*(unsigned char *)&v8 & 2) != 0) {
      goto LABEL_51;
    }
  }
  uint64_t v33 = 0;
  if ((*(_DWORD *)&v8 & 0x40000) != 0)
  {
LABEL_52:
    uint64_t v32 = 2654435761 * self->_subscriberCount;
    if ((*(_DWORD *)&v8 & 0x100000) != 0) {
      goto LABEL_53;
    }
LABEL_58:
    uint64_t v31 = 0;
    if ((*(_DWORD *)&v8 & 0x80000) != 0) {
      goto LABEL_54;
    }
    goto LABEL_59;
  }
LABEL_57:
  uint64_t v32 = 0;
  if ((*(_DWORD *)&v8 & 0x100000) == 0) {
    goto LABEL_58;
  }
LABEL_53:
  uint64_t v31 = 2654435761 * self->_subscriberPlayCount;
  if ((*(_DWORD *)&v8 & 0x80000) != 0)
  {
LABEL_54:
    uint64_t v30 = 2654435761 * self->_subscriberLikedCount;
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v30 = 0;
LABEL_60:
  NSUInteger v29 = [(NSString *)self->_subscriberURL hash];
  NSUInteger v28 = [(NSString *)self->_playlistDescription hash];
  NSUInteger v27 = [(NSString *)self->_cloudUniversalLibraryId hash];
  if (*((unsigned char *)&self->_has + 2)) {
    uint64_t v26 = 2654435761 * self->_secondaryArtworkSourceType;
  }
  else {
    uint64_t v26 = 0;
  }
  NSUInteger v25 = [(NSString *)self->_secondaryArtworkId hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    uint64_t v9 = 2654435761 * self->_playlistCategoryTypeMask;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_playlistGroupingSortKey hash];
  $043343F9A094FB3D6889D8E028CD7DF8 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x20) != 0)
  {
    uint64_t v12 = 2654435761 * self->_likedStateChangedDate;
    if ((*(_DWORD *)&v11 & 0x200000) != 0) {
      goto LABEL_68;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if ((*(_DWORD *)&v11 & 0x200000) != 0)
    {
LABEL_68:
      uint64_t v13 = 2654435761 * self->_traits;
      goto LABEL_71;
    }
  }
  uint64_t v13 = 0;
LABEL_71:
  NSUInteger v14 = [(NSString *)self->_coverArtworkRecipe hash];
  $043343F9A094FB3D6889D8E028CD7DF8 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000000) != 0)
  {
    uint64_t v16 = 2654435761 * self->_isCollaborative;
    if ((*(_WORD *)&v15 & 0x200) != 0) {
      goto LABEL_73;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if ((*(_WORD *)&v15 & 0x200) != 0)
    {
LABEL_73:
      uint64_t v17 = 2654435761 * self->_collaborationMode;
      goto LABEL_76;
    }
  }
  uint64_t v17 = 0;
LABEL_76:
  NSUInteger v18 = [(NSString *)self->_collaborationInvitationURL hash];
  $043343F9A094FB3D6889D8E028CD7DF8 v19 = self->_has;
  if ((*(unsigned char *)&v19 & 4) == 0)
  {
    uint64_t v20 = 0;
    if ((*(_DWORD *)&v19 & 0x4000000) != 0) {
      goto LABEL_78;
    }
LABEL_81:
    uint64_t v21 = 0;
    if ((*(_WORD *)&v19 & 0x400) != 0) {
      goto LABEL_79;
    }
LABEL_82:
    uint64_t v22 = 0;
    goto LABEL_83;
  }
  uint64_t v20 = 2654435761 * self->_collaborationInvitationURLExpirationDate;
  if ((*(_DWORD *)&v19 & 0x4000000) == 0) {
    goto LABEL_81;
  }
LABEL_78:
  uint64_t v21 = 2654435761 * self->_collaborationJoinRequestPending;
  if ((*(_WORD *)&v19 & 0x400) == 0) {
    goto LABEL_82;
  }
LABEL_79:
  uint64_t v22 = 2654435761 * self->_collaboratorStatus;
LABEL_83:
  uint64_t v23 = v67 ^ v68 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21 ^ v22 ^ [(NSMutableArray *)self->_childIdentifiers hash];
  return v23 ^ [(NSMutableArray *)self->_items hash];
}

- (BOOL)isEqual:(id)a3
{
  $043343F9A094FB3D6889D8E028CD7DF8 v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_263;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_263;
    }
  }
  $043343F9A094FB3D6889D8E028CD7DF8 has = self->_has;
  uint64_t v7 = *(void *)(v4 + 340);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_storeId != *((void *)v4 + 9)) {
      goto LABEL_263;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_type != *((_DWORD *)v4 + 81)) {
      goto LABEL_263;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0) {
      goto LABEL_263;
    }
    if (self->_hidden)
    {
      if (!v4[334]) {
        goto LABEL_263;
      }
    }
    else if (v4[334])
    {
      goto LABEL_263;
    }
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_263;
  }
  smartPlaylistInfo = self->_smartPlaylistInfo;
  if ((unint64_t)smartPlaylistInfo | *((void *)v4 + 36))
  {
    if (!-[MIPSmartPlaylistInfo isEqual:](smartPlaylistInfo, "isEqual:")) {
      goto LABEL_263;
    }
    $043343F9A094FB3D6889D8E028CD7DF8 has = self->_has;
    uint64_t v7 = *(void *)(v4 + 340);
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_sortType != *((_DWORD *)v4 + 74)) {
      goto LABEL_263;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0) {
      goto LABEL_263;
    }
    if (self->_reversedSorting)
    {
      if (!v4[337]) {
        goto LABEL_263;
      }
    }
    else if (v4[337])
    {
      goto LABEL_263;
    }
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_263;
  }
  parentIdentifier = self->_parentIdentifier;
  if ((unint64_t)parentIdentifier | *((void *)v4 + 29)
    && !-[MIPMultiverseIdentifier isEqual:](parentIdentifier, "isEqual:"))
  {
    goto LABEL_263;
  }
  geniusSeedTrackIdentifier = self->_geniusSeedTrackIdentifier;
  if ((unint64_t)geniusSeedTrackIdentifier | *((void *)v4 + 25))
  {
    if (!-[MIPMultiverseIdentifier isEqual:](geniusSeedTrackIdentifier, "isEqual:")) {
      goto LABEL_263;
    }
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v11 = self->_has;
  uint64_t v12 = *(void *)(v4 + 340);
  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_distinguishedKind != *((_DWORD *)v4 + 42)) {
      goto LABEL_263;
    }
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_263;
  }
  cloudGlobalId = self->_cloudGlobalId;
  if ((unint64_t)cloudGlobalId | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](cloudGlobalId, "isEqual:")) {
      goto LABEL_263;
    }
    $043343F9A094FB3D6889D8E028CD7DF8 v11 = self->_has;
    uint64_t v12 = *(void *)(v4 + 340);
  }
  if ((*(_DWORD *)&v11 & 0x2000000) != 0)
  {
    if ((v12 & 0x2000000) == 0) {
      goto LABEL_263;
    }
    if (self->_cloudIsSubscribed)
    {
      if (!v4[330]) {
        goto LABEL_263;
      }
    }
    else if (v4[330])
    {
      goto LABEL_263;
    }
  }
  else if ((v12 & 0x2000000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
    if ((v12 & 0x800000) == 0) {
      goto LABEL_263;
    }
    if (self->_cloudIsCuratorPlaylist)
    {
      if (!v4[328]) {
        goto LABEL_263;
      }
    }
    else if (v4[328])
    {
      goto LABEL_263;
    }
  }
  else if ((v12 & 0x800000) != 0)
  {
    goto LABEL_263;
  }
  externalVendorIdentifier = self->_externalVendorIdentifier;
  if ((unint64_t)externalVendorIdentifier | *((void *)v4 + 23)
    && !-[NSString isEqual:](externalVendorIdentifier, "isEqual:"))
  {
    goto LABEL_263;
  }
  externalVendorDisplayName = self->_externalVendorDisplayName;
  if ((unint64_t)externalVendorDisplayName | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](externalVendorDisplayName, "isEqual:")) {
      goto LABEL_263;
    }
  }
  externalVendorTag = self->_externalVendorTag;
  if ((unint64_t)externalVendorTag | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](externalVendorTag, "isEqual:")) {
      goto LABEL_263;
    }
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v17 = self->_has;
  uint64_t v18 = *(void *)(v4 + 340);
  if ((*(_DWORD *)&v17 & 0x10000000) != 0)
  {
    if ((v18 & 0x10000000) == 0) {
      goto LABEL_263;
    }
    if (self->_externalVendorPlaylist)
    {
      if (!v4[333]) {
        goto LABEL_263;
      }
    }
    else if (v4[333])
    {
      goto LABEL_263;
    }
  }
  else if ((v18 & 0x10000000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(unsigned char *)&v17 & 8) != 0)
  {
    if ((v18 & 8) == 0 || self->_creationDateTime != *((void *)v4 + 4)) {
      goto LABEL_263;
    }
  }
  else if ((v18 & 8) != 0)
  {
    goto LABEL_263;
  }
  if ((*(unsigned char *)&v17 & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0 || self->_modificationDateTime != *((void *)v4 + 8)) {
      goto LABEL_263;
    }
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_263;
  }
  if ((*(unsigned char *)&v17 & 0x10) != 0)
  {
    if ((v18 & 0x10) == 0 || self->_lastPlayedDateTime != *((void *)v4 + 5)) {
      goto LABEL_263;
    }
  }
  else if ((v18 & 0x10) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v17 & 0x1000000) != 0)
  {
    if ((v18 & 0x1000000) == 0) {
      goto LABEL_263;
    }
    if (self->_cloudIsSharingDisabled)
    {
      if (!v4[329]) {
        goto LABEL_263;
      }
    }
    else if (v4[329])
    {
      goto LABEL_263;
    }
  }
  else if ((v18 & 0x1000000) != 0)
  {
    goto LABEL_263;
  }
  cloudVersionHash = self->_cloudVersionHash;
  if ((unint64_t)cloudVersionHash | *((void *)v4 + 17)
    && !-[NSString isEqual:](cloudVersionHash, "isEqual:"))
  {
    goto LABEL_263;
  }
  artworkId = self->_artworkId;
  if ((unint64_t)artworkId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](artworkId, "isEqual:")) {
      goto LABEL_263;
    }
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v21 = self->_has;
  uint64_t v22 = *(void *)(v4 + 340);
  if ((*(_WORD *)&v21 & 0x1000) != 0)
  {
    if ((v22 & 0x1000) == 0 || self->_likedState != *((_DWORD *)v4 + 54)) {
      goto LABEL_263;
    }
  }
  else if ((v22 & 0x1000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_WORD *)&v21 & 0x8000) != 0)
  {
    if ((v22 & 0x8000) == 0 || self->_remoteSourceType != *((_DWORD *)v4 + 66)) {
      goto LABEL_263;
    }
  }
  else if ((v22 & 0x8000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v21 & 0x80000000) != 0)
  {
    if ((v22 & 0x80000000) == 0) {
      goto LABEL_263;
    }
    if (self->_owner)
    {
      if (!v4[336]) {
        goto LABEL_263;
      }
    }
    else if (v4[336])
    {
      goto LABEL_263;
    }
  }
  else if ((v22 & 0x80000000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v21 & 0x8000000) != 0)
  {
    if ((v22 & 0x8000000) == 0) {
      goto LABEL_263;
    }
    if (self->_editable)
    {
      if (!v4[332]) {
        goto LABEL_263;
      }
    }
    else if (v4[332])
    {
      goto LABEL_263;
    }
  }
  else if ((v22 & 0x8000000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_WORD *)&v21 & 0x2000) != 0)
  {
    if ((v22 & 0x2000) == 0 || self->_playCount != *((_DWORD *)v4 + 60)) {
      goto LABEL_263;
    }
  }
  else if ((v22 & 0x2000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(void *)&v21 & 0x200000000) != 0)
  {
    if ((v22 & 0x200000000) == 0) {
      goto LABEL_263;
    }
    if (self->_shared)
    {
      if (!v4[338]) {
        goto LABEL_263;
      }
    }
    else if (v4[338])
    {
      goto LABEL_263;
    }
  }
  else if ((v22 & 0x200000000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(void *)&v21 & 0x400000000) != 0)
  {
    if ((v22 & 0x400000000) == 0) {
      goto LABEL_263;
    }
    if (self->_visible)
    {
      if (!v4[339]) {
        goto LABEL_263;
      }
    }
    else if (v4[339])
    {
      goto LABEL_263;
    }
  }
  else if ((v22 & 0x400000000) != 0)
  {
    goto LABEL_263;
  }
  if (*(unsigned char *)&v21)
  {
    if ((v22 & 1) == 0 || self->_authorStoreId != *((void *)v4 + 1)) {
      goto LABEL_263;
    }
  }
  else if (v22)
  {
    goto LABEL_263;
  }
  authorDisplayName = self->_authorDisplayName;
  if ((unint64_t)authorDisplayName | *((void *)v4 + 11)
    && !-[NSString isEqual:](authorDisplayName, "isEqual:"))
  {
    goto LABEL_263;
  }
  authorStoreURL = self->_authorStoreURL;
  if ((unint64_t)authorStoreURL | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](authorStoreURL, "isEqual:")) {
      goto LABEL_263;
    }
  }
  authorHandle = self->_authorHandle;
  if ((unint64_t)authorHandle | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](authorHandle, "isEqual:")) {
      goto LABEL_263;
    }
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v26 = self->_has;
  uint64_t v27 = *(void *)(v4 + 340);
  if ((*(unsigned char *)&v26 & 0x40) != 0)
  {
    if ((v27 & 0x40) == 0 || self->_minRefreshInterval != *((void *)v4 + 7)) {
      goto LABEL_263;
    }
  }
  else if ((v27 & 0x40) != 0)
  {
    goto LABEL_263;
  }
  if ((*(unsigned char *)&v26 & 2) != 0)
  {
    if ((v27 & 2) == 0 || self->_cloudLastUpdateTime != *((void *)v4 + 2)) {
      goto LABEL_263;
    }
  }
  else if ((v27 & 2) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v26 & 0x40000) != 0)
  {
    if ((v27 & 0x40000) == 0 || self->_subscriberCount != *((_DWORD *)v4 + 75)) {
      goto LABEL_263;
    }
  }
  else if ((v27 & 0x40000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v26 & 0x100000) != 0)
  {
    if ((v27 & 0x100000) == 0 || self->_subscriberPlayCount != *((_DWORD *)v4 + 77)) {
      goto LABEL_263;
    }
  }
  else if ((v27 & 0x100000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v26 & 0x80000) != 0)
  {
    if ((v27 & 0x80000) == 0 || self->_subscriberLikedCount != *((_DWORD *)v4 + 76)) {
      goto LABEL_263;
    }
  }
  else if ((v27 & 0x80000) != 0)
  {
    goto LABEL_263;
  }
  subscriberURL = self->_subscriberURL;
  if ((unint64_t)subscriberURL | *((void *)v4 + 39)
    && !-[NSString isEqual:](subscriberURL, "isEqual:"))
  {
    goto LABEL_263;
  }
  playlistDescription = self->_playlistDescription;
  if ((unint64_t)playlistDescription | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](playlistDescription, "isEqual:")) {
      goto LABEL_263;
    }
  }
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if ((unint64_t)cloudUniversalLibraryId | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](cloudUniversalLibraryId, "isEqual:")) {
      goto LABEL_263;
    }
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v31 = self->_has;
  uint64_t v32 = *(void *)(v4 + 340);
  if ((*(_DWORD *)&v31 & 0x10000) != 0)
  {
    if ((v32 & 0x10000) == 0 || self->_secondaryArtworkSourceType != *((_DWORD *)v4 + 70)) {
      goto LABEL_263;
    }
  }
  else if ((v32 & 0x10000) != 0)
  {
    goto LABEL_263;
  }
  secondaryArtworkId = self->_secondaryArtworkId;
  if ((unint64_t)secondaryArtworkId | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](secondaryArtworkId, "isEqual:")) {
      goto LABEL_263;
    }
    $043343F9A094FB3D6889D8E028CD7DF8 v31 = self->_has;
    uint64_t v32 = *(void *)(v4 + 340);
  }
  if ((*(_WORD *)&v31 & 0x4000) != 0)
  {
    if ((v32 & 0x4000) == 0 || self->_playlistCategoryTypeMask != *((_DWORD *)v4 + 61)) {
      goto LABEL_263;
    }
  }
  else if ((v32 & 0x4000) != 0)
  {
    goto LABEL_263;
  }
  playlistGroupingSortKey = self->_playlistGroupingSortKey;
  if ((unint64_t)playlistGroupingSortKey | *((void *)v4 + 32))
  {
    if (!-[NSString isEqual:](playlistGroupingSortKey, "isEqual:")) {
      goto LABEL_263;
    }
    $043343F9A094FB3D6889D8E028CD7DF8 v31 = self->_has;
    uint64_t v32 = *(void *)(v4 + 340);
  }
  if ((*(unsigned char *)&v31 & 0x20) != 0)
  {
    if ((v32 & 0x20) == 0 || self->_likedStateChangedDate != *((void *)v4 + 6)) {
      goto LABEL_263;
    }
  }
  else if ((v32 & 0x20) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v31 & 0x200000) != 0)
  {
    if ((v32 & 0x200000) == 0 || self->_traits != *((_DWORD *)v4 + 80)) {
      goto LABEL_263;
    }
  }
  else if ((v32 & 0x200000) != 0)
  {
    goto LABEL_263;
  }
  coverArtworkRecipe = self->_coverArtworkRecipe;
  if ((unint64_t)coverArtworkRecipe | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](coverArtworkRecipe, "isEqual:")) {
      goto LABEL_263;
    }
    $043343F9A094FB3D6889D8E028CD7DF8 v31 = self->_has;
    uint64_t v32 = *(void *)(v4 + 340);
  }
  if ((*(_DWORD *)&v31 & 0x40000000) != 0)
  {
    if ((v32 & 0x40000000) == 0) {
      goto LABEL_263;
    }
    if (self->_isCollaborative)
    {
      if (!v4[335]) {
        goto LABEL_263;
      }
    }
    else if (v4[335])
    {
      goto LABEL_263;
    }
  }
  else if ((v32 & 0x40000000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_WORD *)&v31 & 0x200) != 0)
  {
    if ((v32 & 0x200) == 0 || self->_collaborationMode != *((_DWORD *)v4 + 38)) {
      goto LABEL_263;
    }
  }
  else if ((v32 & 0x200) != 0)
  {
    goto LABEL_263;
  }
  collaborationInvitationURL = self->_collaborationInvitationURL;
  if ((unint64_t)collaborationInvitationURL | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](collaborationInvitationURL, "isEqual:")) {
      goto LABEL_263;
    }
    $043343F9A094FB3D6889D8E028CD7DF8 v31 = self->_has;
    uint64_t v32 = *(void *)(v4 + 340);
  }
  if ((*(unsigned char *)&v31 & 4) != 0)
  {
    if ((v32 & 4) == 0 || self->_collaborationInvitationURLExpirationDate != *((void *)v4 + 3)) {
      goto LABEL_263;
    }
  }
  else if ((v32 & 4) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v31 & 0x4000000) != 0)
  {
    if ((v32 & 0x4000000) != 0)
    {
      if (self->_collaborationJoinRequestPending)
      {
        if (!v4[331]) {
          goto LABEL_263;
        }
        goto LABEL_254;
      }
      if (!v4[331]) {
        goto LABEL_254;
      }
    }
LABEL_263:
    char v39 = 0;
    goto LABEL_264;
  }
  if ((v32 & 0x4000000) != 0) {
    goto LABEL_263;
  }
LABEL_254:
  if ((*(_WORD *)&v31 & 0x400) != 0)
  {
    if ((v32 & 0x400) == 0 || self->_collaboratorStatus != *((_DWORD *)v4 + 39)) {
      goto LABEL_263;
    }
  }
  else if ((v32 & 0x400) != 0)
  {
    goto LABEL_263;
  }
  childIdentifiers = self->_childIdentifiers;
  if ((unint64_t)childIdentifiers | *((void *)v4 + 14)
    && !-[NSMutableArray isEqual:](childIdentifiers, "isEqual:"))
  {
    goto LABEL_263;
  }
  items = self->_items;
  if ((unint64_t)items | *((void *)v4 + 26)) {
    char v39 = -[NSMutableArray isEqual:](items, "isEqual:");
  }
  else {
    char v39 = 1;
  }
LABEL_264:

  return v39;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v6;

  $043343F9A094FB3D6889D8E028CD7DF8 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *(void *)(v5 + 72) = self->_storeId;
    *(void *)(v5 + 340) |= 0x100uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x20000000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 324) = self->_type;
  *(void *)(v5 + 340) |= 0x400000uLL;
  if ((*(void *)&self->_has & 0x20000000) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 334) = self->_hidden;
    *(void *)(v5 + 340) |= 0x20000000uLL;
  }
LABEL_5:
  id v9 = [(MIPSmartPlaylistInfo *)self->_smartPlaylistInfo copyWithZone:a3];
  NSUInteger v10 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v9;

  $043343F9A094FB3D6889D8E028CD7DF8 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    *(_DWORD *)(v5 + 296) = self->_sortType;
    *(void *)(v5 + 340) |= 0x20000uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v11 = self->_has;
  }
  if ((*(void *)&v11 & 0x100000000) != 0)
  {
    *(unsigned char *)(v5 + 337) = self->_reversedSorting;
    *(void *)(v5 + 340) |= 0x100000000uLL;
  }
  id v12 = [(MIPMultiverseIdentifier *)self->_parentIdentifier copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v12;

  id v14 = [(MIPMultiverseIdentifier *)self->_geniusSeedTrackIdentifier copyWithZone:a3];
  $043343F9A094FB3D6889D8E028CD7DF8 v15 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v14;

  if ((*((unsigned char *)&self->_has + 1) & 8) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_distinguishedKind;
    *(void *)(v5 + 340) |= 0x800uLL;
  }
  uint64_t v16 = [(NSString *)self->_cloudGlobalId copyWithZone:a3];
  $043343F9A094FB3D6889D8E028CD7DF8 v17 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v16;

  $043343F9A094FB3D6889D8E028CD7DF8 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x2000000) != 0)
  {
    *(unsigned char *)(v5 + 330) = self->_cloudIsSubscribed;
    *(void *)(v5 + 340) |= 0x2000000uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v18 = self->_has;
  }
  if ((*(_DWORD *)&v18 & 0x800000) != 0)
  {
    *(unsigned char *)(v5 + 328) = self->_cloudIsCuratorPlaylist;
    *(void *)(v5 + 340) |= 0x800000uLL;
  }
  uint64_t v19 = [(NSString *)self->_externalVendorIdentifier copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v19;

  uint64_t v21 = [(NSString *)self->_externalVendorDisplayName copyWithZone:a3];
  uint64_t v22 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v21;

  uint64_t v23 = [(NSString *)self->_externalVendorTag copyWithZone:a3];
  v24 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v23;

  $043343F9A094FB3D6889D8E028CD7DF8 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x10000000) != 0)
  {
    *(unsigned char *)(v5 + 333) = self->_externalVendorPlaylist;
    *(void *)(v5 + 340) |= 0x10000000uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v25 = self->_has;
    if ((*(unsigned char *)&v25 & 8) == 0)
    {
LABEL_17:
      if ((*(unsigned char *)&v25 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_72;
    }
  }
  else if ((*(unsigned char *)&v25 & 8) == 0)
  {
    goto LABEL_17;
  }
  *(void *)(v5 + 32) = self->_creationDateTime;
  *(void *)(v5 + 340) |= 8uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x80) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v25 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(void *)(v5 + 64) = self->_modificationDateTime;
  *(void *)(v5 + 340) |= 0x80uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x10) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v25 & 0x1000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_73:
  *(void *)(v5 + 40) = self->_lastPlayedDateTime;
  *(void *)(v5 + 340) |= 0x10uLL;
  if ((*(void *)&self->_has & 0x1000000) != 0)
  {
LABEL_20:
    *(unsigned char *)(v5 + 329) = self->_cloudIsSharingDisabled;
    *(void *)(v5 + 340) |= 0x1000000uLL;
  }
LABEL_21:
  uint64_t v26 = [(NSString *)self->_cloudVersionHash copyWithZone:a3];
  uint64_t v27 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v26;

  uint64_t v28 = [(NSString *)self->_artworkId copyWithZone:a3];
  NSUInteger v29 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v28;

  $043343F9A094FB3D6889D8E028CD7DF8 v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 216) = self->_likedState;
    *(void *)(v5 + 340) |= 0x1000uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v30 = self->_has;
    if ((*(_WORD *)&v30 & 0x8000) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&v30 & 0x80000000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&v30 & 0x8000) == 0)
  {
    goto LABEL_23;
  }
  *(_DWORD *)(v5 + 264) = self->_remoteSourceType;
  *(void *)(v5 + 340) |= 0x8000uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x80000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v30 & 0x8000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(unsigned char *)(v5 + 336) = self->_owner;
  *(void *)(v5 + 340) |= 0x80000000uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x8000000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v30 & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(unsigned char *)(v5 + 332) = self->_editable;
  *(void *)(v5 + 340) |= 0x8000000uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x2000) == 0)
  {
LABEL_26:
    if ((*(void *)&v30 & 0x200000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(_DWORD *)(v5 + 240) = self->_playCount;
  *(void *)(v5 + 340) |= 0x2000uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v30 = self->_has;
  if ((*(void *)&v30 & 0x200000000) == 0)
  {
LABEL_27:
    if ((*(void *)&v30 & 0x400000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(unsigned char *)(v5 + 338) = self->_shared;
  *(void *)(v5 + 340) |= 0x200000000uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v30 = self->_has;
  if ((*(void *)&v30 & 0x400000000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v30 & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_81:
  *(unsigned char *)(v5 + 339) = self->_visible;
  *(void *)(v5 + 340) |= 0x400000000uLL;
  if (*(void *)&self->_has)
  {
LABEL_29:
    *(void *)(v5 + 8) = self->_authorStoreId;
    *(void *)(v5 + 340) |= 1uLL;
  }
LABEL_30:
  uint64_t v31 = [(NSString *)self->_authorDisplayName copyWithZone:a3];
  uint64_t v32 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v31;

  uint64_t v33 = [(NSString *)self->_authorStoreURL copyWithZone:a3];
  uint64_t v34 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v33;

  uint64_t v35 = [(NSString *)self->_authorHandle copyWithZone:a3];
  NSUInteger v36 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v35;

  $043343F9A094FB3D6889D8E028CD7DF8 v37 = self->_has;
  if ((*(unsigned char *)&v37 & 0x40) != 0)
  {
    *(void *)(v5 + 56) = self->_minRefreshInterval;
    *(void *)(v5 + 340) |= 0x40uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v37 = self->_has;
    if ((*(unsigned char *)&v37 & 2) == 0)
    {
LABEL_32:
      if ((*(_DWORD *)&v37 & 0x40000) == 0) {
        goto LABEL_33;
      }
      goto LABEL_85;
    }
  }
  else if ((*(unsigned char *)&v37 & 2) == 0)
  {
    goto LABEL_32;
  }
  *(void *)(v5 + 16) = self->_cloudLastUpdateTime;
  *(void *)(v5 + 340) |= 2uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v37 = self->_has;
  if ((*(_DWORD *)&v37 & 0x40000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v37 & 0x100000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v5 + 300) = self->_subscriberCount;
  *(void *)(v5 + 340) |= 0x40000uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v37 = self->_has;
  if ((*(_DWORD *)&v37 & 0x100000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v37 & 0x80000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_86:
  *(_DWORD *)(v5 + 308) = self->_subscriberPlayCount;
  *(void *)(v5 + 340) |= 0x100000uLL;
  if ((*(void *)&self->_has & 0x80000) != 0)
  {
LABEL_35:
    *(_DWORD *)(v5 + 304) = self->_subscriberLikedCount;
    *(void *)(v5 + 340) |= 0x80000uLL;
  }
LABEL_36:
  uint64_t v38 = [(NSString *)self->_subscriberURL copyWithZone:a3];
  char v39 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v38;

  uint64_t v40 = [(NSString *)self->_playlistDescription copyWithZone:a3];
  uint64_t v41 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v40;

  uint64_t v42 = [(NSString *)self->_cloudUniversalLibraryId copyWithZone:a3];
  uint64_t v43 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v42;

  if (*((unsigned char *)&self->_has + 2))
  {
    *(_DWORD *)(v5 + 280) = self->_secondaryArtworkSourceType;
    *(void *)(v5 + 340) |= 0x10000uLL;
  }
  uint64_t v44 = [(NSString *)self->_secondaryArtworkId copyWithZone:a3];
  uint64_t v45 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v44;

  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 244) = self->_playlistCategoryTypeMask;
    *(void *)(v5 + 340) |= 0x4000uLL;
  }
  uint64_t v46 = [(NSString *)self->_playlistGroupingSortKey copyWithZone:a3];
  NSUInteger v47 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v46;

  $043343F9A094FB3D6889D8E028CD7DF8 v48 = self->_has;
  if ((*(unsigned char *)&v48 & 0x20) != 0)
  {
    *(void *)(v5 + 48) = self->_likedStateChangedDate;
    *(void *)(v5 + 340) |= 0x20uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v48 = self->_has;
  }
  if ((*(_DWORD *)&v48 & 0x200000) != 0)
  {
    *(_DWORD *)(v5 + 320) = self->_traits;
    *(void *)(v5 + 340) |= 0x200000uLL;
  }
  uint64_t v49 = [(NSString *)self->_coverArtworkRecipe copyWithZone:a3];
  uint64_t v50 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v49;

  $043343F9A094FB3D6889D8E028CD7DF8 v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x40000000) != 0)
  {
    *(unsigned char *)(v5 + 335) = self->_isCollaborative;
    *(void *)(v5 + 340) |= 0x40000000uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v51 = self->_has;
  }
  if ((*(_WORD *)&v51 & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_collaborationMode;
    *(void *)(v5 + 340) |= 0x200uLL;
  }
  uint64_t v52 = [(NSString *)self->_collaborationInvitationURL copyWithZone:a3];
  NSUInteger v53 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v52;

  $043343F9A094FB3D6889D8E028CD7DF8 v54 = self->_has;
  if ((*(unsigned char *)&v54 & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_collaborationInvitationURLExpirationDate;
    *(void *)(v5 + 340) |= 4uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v54 = self->_has;
    if ((*(_DWORD *)&v54 & 0x4000000) == 0)
    {
LABEL_50:
      if ((*(_WORD *)&v54 & 0x400) == 0) {
        goto LABEL_52;
      }
      goto LABEL_51;
    }
  }
  else if ((*(_DWORD *)&v54 & 0x4000000) == 0)
  {
    goto LABEL_50;
  }
  *(unsigned char *)(v5 + 331) = self->_collaborationJoinRequestPending;
  *(void *)(v5 + 340) |= 0x4000000uLL;
  if ((*(void *)&self->_has & 0x400) != 0)
  {
LABEL_51:
    *(_DWORD *)(v5 + 156) = self->_collaboratorStatus;
    *(void *)(v5 + 340) |= 0x400uLL;
  }
LABEL_52:
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  NSUInteger v55 = self->_childIdentifiers;
  uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v73 objects:v78 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v74;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v74 != v58) {
          objc_enumerationMutation(v55);
        }
        unint64_t v60 = (void *)[*(id *)(*((void *)&v73 + 1) + 8 * v59) copyWithZone:a3];
        [(id)v5 addChildIdentifiers:v60];

        ++v59;
      }
      while (v57 != v59);
      uint64_t v57 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v73 objects:v78 count:16];
    }
    while (v57);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  unint64_t v61 = self->_items;
  uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v70;
    do
    {
      uint64_t v65 = 0;
      do
      {
        if (*(void *)v70 != v64) {
          objc_enumerationMutation(v61);
        }
        uint64_t v66 = objc_msgSend(*(id *)(*((void *)&v69 + 1) + 8 * v65), "copyWithZone:", a3, (void)v69);
        [(id)v5 addItems:v66];

        ++v65;
      }
      while (v63 != v65);
      uint64_t v63 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v63);
  }

  id v67 = (id)v5;
  return v67;
}

- (void)copyTo:(id)a3
{
  $043343F9A094FB3D6889D8E028CD7DF8 v4 = (char *)a3;
  uint64_t v22 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  $043343F9A094FB3D6889D8E028CD7DF8 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *((void *)v4 + 9) = self->_storeId;
    *(void *)(v4 + 340) |= 0x100uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x20000000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 81) = self->_type;
  *(void *)(v4 + 340) |= 0x400000uLL;
  if ((*(void *)&self->_has & 0x20000000) != 0)
  {
LABEL_6:
    v4[334] = self->_hidden;
    *(void *)(v4 + 340) |= 0x20000000uLL;
  }
LABEL_7:
  if (self->_smartPlaylistInfo)
  {
    objc_msgSend(v22, "setSmartPlaylistInfo:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) != 0)
  {
    *((_DWORD *)v4 + 74) = self->_sortType;
    *(void *)(v4 + 340) |= 0x20000uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v6 = self->_has;
  }
  if ((*(void *)&v6 & 0x100000000) != 0)
  {
    v4[337] = self->_reversedSorting;
    *(void *)(v4 + 340) |= 0x100000000uLL;
  }
  if (self->_parentIdentifier)
  {
    objc_msgSend(v22, "setParentIdentifier:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  if (self->_geniusSeedTrackIdentifier)
  {
    objc_msgSend(v22, "setGeniusSeedTrackIdentifier:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0)
  {
    *((_DWORD *)v4 + 42) = self->_distinguishedKind;
    *(void *)(v4 + 340) |= 0x800uLL;
  }
  if (self->_cloudGlobalId)
  {
    objc_msgSend(v22, "setCloudGlobalId:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0)
  {
    v4[330] = self->_cloudIsSubscribed;
    *(void *)(v4 + 340) |= 0x2000000uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v7 = self->_has;
  }
  if ((*(_DWORD *)&v7 & 0x800000) != 0)
  {
    v4[328] = self->_cloudIsCuratorPlaylist;
    *(void *)(v4 + 340) |= 0x800000uLL;
  }
  if (self->_externalVendorIdentifier)
  {
    objc_msgSend(v22, "setExternalVendorIdentifier:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  if (self->_externalVendorDisplayName)
  {
    objc_msgSend(v22, "setExternalVendorDisplayName:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  if (self->_externalVendorTag)
  {
    objc_msgSend(v22, "setExternalVendorTag:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000000) != 0)
  {
    v4[333] = self->_externalVendorPlaylist;
    *(void *)(v4 + 340) |= 0x10000000uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v8 = self->_has;
    if ((*(unsigned char *)&v8 & 8) == 0)
    {
LABEL_33:
      if ((*(unsigned char *)&v8 & 0x80) == 0) {
        goto LABEL_34;
      }
      goto LABEL_108;
    }
  }
  else if ((*(unsigned char *)&v8 & 8) == 0)
  {
    goto LABEL_33;
  }
  *((void *)v4 + 4) = self->_creationDateTime;
  *(void *)(v4 + 340) |= 8uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x80) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v8 & 0x10) == 0) {
      goto LABEL_35;
    }
    goto LABEL_109;
  }
LABEL_108:
  *((void *)v4 + 8) = self->_modificationDateTime;
  *(void *)(v4 + 340) |= 0x80uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x10) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_109:
  *((void *)v4 + 5) = self->_lastPlayedDateTime;
  *(void *)(v4 + 340) |= 0x10uLL;
  if ((*(void *)&self->_has & 0x1000000) != 0)
  {
LABEL_36:
    v4[329] = self->_cloudIsSharingDisabled;
    *(void *)(v4 + 340) |= 0x1000000uLL;
  }
LABEL_37:
  if (self->_cloudVersionHash)
  {
    objc_msgSend(v22, "setCloudVersionHash:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  if (self->_artworkId)
  {
    objc_msgSend(v22, "setArtworkId:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
    *((_DWORD *)v4 + 54) = self->_likedState;
    *(void *)(v4 + 340) |= 0x1000uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x8000) == 0)
    {
LABEL_43:
      if ((*(_DWORD *)&v9 & 0x80000000) == 0) {
        goto LABEL_44;
      }
      goto LABEL_113;
    }
  }
  else if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
    goto LABEL_43;
  }
  *((_DWORD *)v4 + 66) = self->_remoteSourceType;
  *(void *)(v4 + 340) |= 0x8000uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v9 & 0x8000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_114;
  }
LABEL_113:
  v4[336] = self->_owner;
  *(void *)(v4 + 340) |= 0x80000000uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x8000000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v9 & 0x2000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_115;
  }
LABEL_114:
  v4[332] = self->_editable;
  *(void *)(v4 + 340) |= 0x8000000uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
LABEL_46:
    if ((*(void *)&v9 & 0x200000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_116;
  }
LABEL_115:
  *((_DWORD *)v4 + 60) = self->_playCount;
  *(void *)(v4 + 340) |= 0x2000uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v9 = self->_has;
  if ((*(void *)&v9 & 0x200000000) == 0)
  {
LABEL_47:
    if ((*(void *)&v9 & 0x400000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_117;
  }
LABEL_116:
  v4[338] = self->_shared;
  *(void *)(v4 + 340) |= 0x200000000uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v9 = self->_has;
  if ((*(void *)&v9 & 0x400000000) == 0)
  {
LABEL_48:
    if ((*(unsigned char *)&v9 & 1) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_117:
  v4[339] = self->_visible;
  *(void *)(v4 + 340) |= 0x400000000uLL;
  if (*(void *)&self->_has)
  {
LABEL_49:
    *((void *)v4 + 1) = self->_authorStoreId;
    *(void *)(v4 + 340) |= 1uLL;
  }
LABEL_50:
  if (self->_authorDisplayName)
  {
    objc_msgSend(v22, "setAuthorDisplayName:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  if (self->_authorStoreURL)
  {
    objc_msgSend(v22, "setAuthorStoreURL:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  if (self->_authorHandle)
  {
    objc_msgSend(v22, "setAuthorHandle:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x40) != 0)
  {
    *((void *)v4 + 7) = self->_minRefreshInterval;
    *(void *)(v4 + 340) |= 0x40uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v10 = self->_has;
    if ((*(unsigned char *)&v10 & 2) == 0)
    {
LABEL_58:
      if ((*(_DWORD *)&v10 & 0x40000) == 0) {
        goto LABEL_59;
      }
      goto LABEL_121;
    }
  }
  else if ((*(unsigned char *)&v10 & 2) == 0)
  {
    goto LABEL_58;
  }
  *((void *)v4 + 2) = self->_cloudLastUpdateTime;
  *(void *)(v4 + 340) |= 2uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v10 & 0x100000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_122;
  }
LABEL_121:
  *((_DWORD *)v4 + 75) = self->_subscriberCount;
  *(void *)(v4 + 340) |= 0x40000uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
LABEL_60:
    if ((*(_DWORD *)&v10 & 0x80000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_122:
  *((_DWORD *)v4 + 77) = self->_subscriberPlayCount;
  *(void *)(v4 + 340) |= 0x100000uLL;
  if ((*(void *)&self->_has & 0x80000) != 0)
  {
LABEL_61:
    *((_DWORD *)v4 + 76) = self->_subscriberLikedCount;
    *(void *)(v4 + 340) |= 0x80000uLL;
  }
LABEL_62:
  if (self->_subscriberURL)
  {
    objc_msgSend(v22, "setSubscriberURL:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  if (self->_playlistDescription)
  {
    objc_msgSend(v22, "setPlaylistDescription:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  if (self->_cloudUniversalLibraryId)
  {
    objc_msgSend(v22, "setCloudUniversalLibraryId:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  if (*((unsigned char *)&self->_has + 2))
  {
    *((_DWORD *)v4 + 70) = self->_secondaryArtworkSourceType;
    *(void *)(v4 + 340) |= 0x10000uLL;
  }
  if (self->_secondaryArtworkId)
  {
    objc_msgSend(v22, "setSecondaryArtworkId:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *((_DWORD *)v4 + 61) = self->_playlistCategoryTypeMask;
    *(void *)(v4 + 340) |= 0x4000uLL;
  }
  if (self->_playlistGroupingSortKey)
  {
    objc_msgSend(v22, "setPlaylistGroupingSortKey:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x20) != 0)
  {
    *((void *)v4 + 6) = self->_likedStateChangedDate;
    *(void *)(v4 + 340) |= 0x20uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v11 = self->_has;
  }
  if ((*(_DWORD *)&v11 & 0x200000) != 0)
  {
    *((_DWORD *)v4 + 80) = self->_traits;
    *(void *)(v4 + 340) |= 0x200000uLL;
  }
  if (self->_coverArtworkRecipe)
  {
    objc_msgSend(v22, "setCoverArtworkRecipe:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000000) != 0)
  {
    v4[335] = self->_isCollaborative;
    *(void *)(v4 + 340) |= 0x40000000uLL;
    $043343F9A094FB3D6889D8E028CD7DF8 v12 = self->_has;
  }
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
    *((_DWORD *)v4 + 38) = self->_collaborationMode;
    *(void *)(v4 + 340) |= 0x200uLL;
  }
  if (self->_collaborationInvitationURL)
  {
    objc_msgSend(v22, "setCollaborationInvitationURL:");
    $043343F9A094FB3D6889D8E028CD7DF8 v4 = v22;
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 4) == 0)
  {
    if ((*(_DWORD *)&v13 & 0x4000000) == 0) {
      goto LABEL_90;
    }
LABEL_125:
    v4[331] = self->_collaborationJoinRequestPending;
    *(void *)(v4 + 340) |= 0x4000000uLL;
    if ((*(void *)&self->_has & 0x400) == 0) {
      goto LABEL_92;
    }
    goto LABEL_91;
  }
  *((void *)v4 + 3) = self->_collaborationInvitationURLExpirationDate;
  *(void *)(v4 + 340) |= 4uLL;
  $043343F9A094FB3D6889D8E028CD7DF8 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x4000000) != 0) {
    goto LABEL_125;
  }
LABEL_90:
  if ((*(_WORD *)&v13 & 0x400) != 0)
  {
LABEL_91:
    *((_DWORD *)v4 + 39) = self->_collaboratorStatus;
    *(void *)(v4 + 340) |= 0x400uLL;
  }
LABEL_92:
  if ([(MIPPlaylist *)self childIdentifiersCount])
  {
    [v22 clearChildIdentifiers];
    unint64_t v14 = [(MIPPlaylist *)self childIdentifiersCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t i = 0; i != v15; ++i)
      {
        $043343F9A094FB3D6889D8E028CD7DF8 v17 = [(MIPPlaylist *)self childIdentifiersAtIndex:i];
        [v22 addChildIdentifiers:v17];
      }
    }
  }
  if ([(MIPPlaylist *)self itemsCount])
  {
    [v22 clearItems];
    unint64_t v18 = [(MIPPlaylist *)self itemsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t j = 0; j != v19; ++j)
      {
        uint64_t v21 = [(MIPPlaylist *)self itemsAtIndex:j];
        [v22 addItems:v21];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  $043343F9A094FB3D6889D8E028CD7DF8 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    PBDataWriterWriteInt64Field();
    $043343F9A094FB3D6889D8E028CD7DF8 has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x20000000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x20000000) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
  if (self->_smartPlaylistInfo) {
    PBDataWriterWriteSubmessage();
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $043343F9A094FB3D6889D8E028CD7DF8 v6 = self->_has;
  }
  if ((*(void *)&v6 & 0x100000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_parentIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_geniusSeedTrackIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_cloudGlobalId) {
    PBDataWriterWriteStringField();
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $043343F9A094FB3D6889D8E028CD7DF8 v7 = self->_has;
  }
  if ((*(_DWORD *)&v7 & 0x800000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_externalVendorIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_externalVendorDisplayName) {
    PBDataWriterWriteStringField();
  }
  if (self->_externalVendorTag) {
    PBDataWriterWriteStringField();
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $043343F9A094FB3D6889D8E028CD7DF8 v8 = self->_has;
    if ((*(unsigned char *)&v8 & 8) == 0)
    {
LABEL_33:
      if ((*(unsigned char *)&v8 & 0x80) == 0) {
        goto LABEL_34;
      }
      goto LABEL_112;
    }
  }
  else if ((*(unsigned char *)&v8 & 8) == 0)
  {
    goto LABEL_33;
  }
  PBDataWriterWriteInt64Field();
  $043343F9A094FB3D6889D8E028CD7DF8 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x80) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v8 & 0x10) == 0) {
      goto LABEL_35;
    }
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteInt64Field();
  $043343F9A094FB3D6889D8E028CD7DF8 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x10) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_113:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x1000000) != 0) {
LABEL_36:
  }
    PBDataWriterWriteBOOLField();
LABEL_37:
  if (self->_cloudVersionHash) {
    PBDataWriterWriteStringField();
  }
  if (self->_artworkId) {
    PBDataWriterWriteStringField();
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $043343F9A094FB3D6889D8E028CD7DF8 v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x8000) == 0)
    {
LABEL_43:
      if ((*(_DWORD *)&v9 & 0x80000000) == 0) {
        goto LABEL_44;
      }
      goto LABEL_117;
    }
  }
  else if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
    goto LABEL_43;
  }
  PBDataWriterWriteInt32Field();
  $043343F9A094FB3D6889D8E028CD7DF8 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v9 & 0x8000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteBOOLField();
  $043343F9A094FB3D6889D8E028CD7DF8 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x8000000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v9 & 0x2000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteBOOLField();
  $043343F9A094FB3D6889D8E028CD7DF8 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
LABEL_46:
    if ((*(void *)&v9 & 0x200000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteInt32Field();
  $043343F9A094FB3D6889D8E028CD7DF8 v9 = self->_has;
  if ((*(void *)&v9 & 0x200000000) == 0)
  {
LABEL_47:
    if ((*(void *)&v9 & 0x400000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteBOOLField();
  $043343F9A094FB3D6889D8E028CD7DF8 v9 = self->_has;
  if ((*(void *)&v9 & 0x400000000) == 0)
  {
LABEL_48:
    if ((*(unsigned char *)&v9 & 1) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_121:
  PBDataWriterWriteBOOLField();
  if (*(void *)&self->_has) {
LABEL_49:
  }
    PBDataWriterWriteInt64Field();
LABEL_50:
  if (self->_authorDisplayName) {
    PBDataWriterWriteStringField();
  }
  if (self->_authorStoreURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_authorHandle) {
    PBDataWriterWriteStringField();
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x40) != 0)
  {
    PBDataWriterWriteInt64Field();
    $043343F9A094FB3D6889D8E028CD7DF8 v10 = self->_has;
    if ((*(unsigned char *)&v10 & 2) == 0)
    {
LABEL_58:
      if ((*(_DWORD *)&v10 & 0x40000) == 0) {
        goto LABEL_59;
      }
      goto LABEL_125;
    }
  }
  else if ((*(unsigned char *)&v10 & 2) == 0)
  {
    goto LABEL_58;
  }
  PBDataWriterWriteInt64Field();
  $043343F9A094FB3D6889D8E028CD7DF8 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v10 & 0x100000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteInt32Field();
  $043343F9A094FB3D6889D8E028CD7DF8 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
LABEL_60:
    if ((*(_DWORD *)&v10 & 0x80000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_126:
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x80000) != 0) {
LABEL_61:
  }
    PBDataWriterWriteInt32Field();
LABEL_62:
  if (self->_subscriberURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_playlistDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_cloudUniversalLibraryId) {
    PBDataWriterWriteStringField();
  }
  if (*((unsigned char *)&self->_has + 2)) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_secondaryArtworkId) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_playlistGroupingSortKey) {
    PBDataWriterWriteStringField();
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x20) != 0)
  {
    PBDataWriterWriteInt64Field();
    $043343F9A094FB3D6889D8E028CD7DF8 v11 = self->_has;
  }
  if ((*(_DWORD *)&v11 & 0x200000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_coverArtworkRecipe) {
    PBDataWriterWriteStringField();
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $043343F9A094FB3D6889D8E028CD7DF8 v12 = self->_has;
  }
  if ((*(_WORD *)&v12 & 0x200) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_collaborationInvitationURL) {
    PBDataWriterWriteStringField();
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    $043343F9A094FB3D6889D8E028CD7DF8 v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x4000000) == 0)
    {
LABEL_90:
      if ((*(_WORD *)&v13 & 0x400) == 0) {
        goto LABEL_92;
      }
      goto LABEL_91;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x4000000) == 0)
  {
    goto LABEL_90;
  }
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x400) != 0) {
LABEL_91:
  }
    PBDataWriterWriteInt32Field();
LABEL_92:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v14 = self->_childIdentifiers;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v16);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unint64_t v19 = self->_items;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v21);
  }
}

- (BOOL)readFrom:(id)a3
{
  return MIPPlaylistReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  $043343F9A094FB3D6889D8E028CD7DF8 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    $043343F9A094FB3D6889D8E028CD7DF8 v13 = [NSNumber numberWithLongLong:self->_storeId];
    [v4 setObject:v13 forKey:@"storeId"];

    $043343F9A094FB3D6889D8E028CD7DF8 has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x20000000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_5;
  }
  unsigned int v14 = self->_type - 1;
  if (v14 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v15 = off_1E5FB5328[v14];
  }
  [v4 setObject:v15 forKey:@"type"];

  if ((*(void *)&self->_has & 0x20000000) != 0)
  {
LABEL_6:
    $043343F9A094FB3D6889D8E028CD7DF8 v7 = [NSNumber numberWithBool:self->_hidden];
    [v4 setObject:v7 forKey:@"hidden"];
  }
LABEL_7:
  smartPlaylistInfo = self->_smartPlaylistInfo;
  if (smartPlaylistInfo)
  {
    $043343F9A094FB3D6889D8E028CD7DF8 v9 = [(MIPSmartPlaylistInfo *)smartPlaylistInfo dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"smartPlaylistInfo"];
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    uint64_t sortType = self->_sortType;
    if (sortType >= 0x4C)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sortType);
      $043343F9A094FB3D6889D8E028CD7DF8 v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      $043343F9A094FB3D6889D8E028CD7DF8 v12 = off_1E5FB5348[sortType];
    }
    [v4 setObject:v12 forKey:@"sortType"];

    $043343F9A094FB3D6889D8E028CD7DF8 v10 = self->_has;
  }
  if ((*(void *)&v10 & 0x100000000) != 0)
  {
    uint64_t v16 = [NSNumber numberWithBool:self->_reversedSorting];
    [v4 setObject:v16 forKey:@"reversedSorting"];
  }
  parentIdentifier = self->_parentIdentifier;
  if (parentIdentifier)
  {
    uint64_t v18 = [(MIPMultiverseIdentifier *)parentIdentifier dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"parentIdentifier"];
  }
  geniusSeedTrackIdentifier = self->_geniusSeedTrackIdentifier;
  if (geniusSeedTrackIdentifier)
  {
    uint64_t v20 = [(MIPMultiverseIdentifier *)geniusSeedTrackIdentifier dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"geniusSeedTrackIdentifier"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0)
  {
    uint64_t v21 = [NSNumber numberWithInt:self->_distinguishedKind];
    [v4 setObject:v21 forKey:@"distinguishedKind"];
  }
  cloudGlobalId = self->_cloudGlobalId;
  if (cloudGlobalId) {
    [v4 setObject:cloudGlobalId forKey:@"cloudGlobalId"];
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x2000000) != 0)
  {
    long long v24 = [NSNumber numberWithBool:self->_cloudIsSubscribed];
    [v4 setObject:v24 forKey:@"cloudIsSubscribed"];

    $043343F9A094FB3D6889D8E028CD7DF8 v23 = self->_has;
  }
  if ((*(_DWORD *)&v23 & 0x800000) != 0)
  {
    long long v25 = [NSNumber numberWithBool:self->_cloudIsCuratorPlaylist];
    [v4 setObject:v25 forKey:@"cloudIsCuratorPlaylist"];
  }
  externalVendorIdentifier = self->_externalVendorIdentifier;
  if (externalVendorIdentifier) {
    [v4 setObject:externalVendorIdentifier forKey:@"externalVendorIdentifier"];
  }
  externalVendorDisplayName = self->_externalVendorDisplayName;
  if (externalVendorDisplayName) {
    [v4 setObject:externalVendorDisplayName forKey:@"externalVendorDisplayName"];
  }
  externalVendorTag = self->_externalVendorTag;
  if (externalVendorTag) {
    [v4 setObject:externalVendorTag forKey:@"externalVendorTag"];
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x10000000) != 0)
  {
    long long v73 = [NSNumber numberWithBool:self->_externalVendorPlaylist];
    [v4 setObject:v73 forKey:@"externalVendorPlaylist"];

    $043343F9A094FB3D6889D8E028CD7DF8 v29 = self->_has;
    if ((*(unsigned char *)&v29 & 8) == 0)
    {
LABEL_39:
      if ((*(unsigned char *)&v29 & 0x80) == 0) {
        goto LABEL_40;
      }
      goto LABEL_119;
    }
  }
  else if ((*(unsigned char *)&v29 & 8) == 0)
  {
    goto LABEL_39;
  }
  long long v74 = [NSNumber numberWithLongLong:self->_creationDateTime];
  [v4 setObject:v74 forKey:@"creationDateTime"];

  $043343F9A094FB3D6889D8E028CD7DF8 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 0x80) == 0)
  {
LABEL_40:
    if ((*(unsigned char *)&v29 & 0x10) == 0) {
      goto LABEL_41;
    }
    goto LABEL_120;
  }
LABEL_119:
  long long v75 = [NSNumber numberWithLongLong:self->_modificationDateTime];
  [v4 setObject:v75 forKey:@"modificationDateTime"];

  $043343F9A094FB3D6889D8E028CD7DF8 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 0x10) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v29 & 0x1000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_120:
  long long v76 = [NSNumber numberWithLongLong:self->_lastPlayedDateTime];
  [v4 setObject:v76 forKey:@"lastPlayedDateTime"];

  if ((*(void *)&self->_has & 0x1000000) != 0)
  {
LABEL_42:
    long long v30 = [NSNumber numberWithBool:self->_cloudIsSharingDisabled];
    [v4 setObject:v30 forKey:@"cloudIsSharingDisabled"];
  }
LABEL_43:
  cloudVersionHash = self->_cloudVersionHash;
  if (cloudVersionHash) {
    [v4 setObject:cloudVersionHash forKey:@"cloudVersionHash"];
  }
  artworkId = self->_artworkId;
  if (artworkId) {
    [v4 setObject:artworkId forKey:@"artworkId"];
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x1000) != 0)
  {
    v77 = [NSNumber numberWithInt:self->_likedState];
    [v4 setObject:v77 forKey:@"likedState"];

    $043343F9A094FB3D6889D8E028CD7DF8 v33 = self->_has;
    if ((*(_WORD *)&v33 & 0x8000) == 0)
    {
LABEL_49:
      if ((*(_DWORD *)&v33 & 0x80000000) == 0) {
        goto LABEL_50;
      }
      goto LABEL_124;
    }
  }
  else if ((*(_WORD *)&v33 & 0x8000) == 0)
  {
    goto LABEL_49;
  }
  v78 = [NSNumber numberWithInt:self->_remoteSourceType];
  [v4 setObject:v78 forKey:@"remoteSourceType"];

  $043343F9A094FB3D6889D8E028CD7DF8 v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x80000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v33 & 0x8000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_125;
  }
LABEL_124:
  uint64_t v79 = [NSNumber numberWithBool:self->_owner];
  [v4 setObject:v79 forKey:@"owner"];

  $043343F9A094FB3D6889D8E028CD7DF8 v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x8000000) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&v33 & 0x2000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_126;
  }
LABEL_125:
  v80 = [NSNumber numberWithBool:self->_editable];
  [v4 setObject:v80 forKey:@"editable"];

  $043343F9A094FB3D6889D8E028CD7DF8 v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x2000) == 0)
  {
LABEL_52:
    if ((*(void *)&v33 & 0x200000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_127;
  }
LABEL_126:
  v81 = [NSNumber numberWithInt:self->_playCount];
  [v4 setObject:v81 forKey:@"playCount"];

  $043343F9A094FB3D6889D8E028CD7DF8 v33 = self->_has;
  if ((*(void *)&v33 & 0x200000000) == 0)
  {
LABEL_53:
    if ((*(void *)&v33 & 0x400000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_128;
  }
LABEL_127:
  v82 = [NSNumber numberWithBool:self->_shared];
  [v4 setObject:v82 forKey:@"shared"];

  $043343F9A094FB3D6889D8E028CD7DF8 v33 = self->_has;
  if ((*(void *)&v33 & 0x400000000) == 0)
  {
LABEL_54:
    if ((*(unsigned char *)&v33 & 1) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_128:
  v83 = [NSNumber numberWithBool:self->_visible];
  [v4 setObject:v83 forKey:@"visible"];

  if (*(void *)&self->_has)
  {
LABEL_55:
    uint64_t v34 = [NSNumber numberWithLongLong:self->_authorStoreId];
    [v4 setObject:v34 forKey:@"authorStoreId"];
  }
LABEL_56:
  authorDisplayName = self->_authorDisplayName;
  if (authorDisplayName) {
    [v4 setObject:authorDisplayName forKey:@"authorDisplayName"];
  }
  authorStoreURL = self->_authorStoreURL;
  if (authorStoreURL) {
    [v4 setObject:authorStoreURL forKey:@"authorStoreURL"];
  }
  authorHandle = self->_authorHandle;
  if (authorHandle) {
    [v4 setObject:authorHandle forKey:@"authorHandle"];
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v38 = self->_has;
  if ((*(unsigned char *)&v38 & 0x40) != 0)
  {
    v84 = [NSNumber numberWithLongLong:self->_minRefreshInterval];
    [v4 setObject:v84 forKey:@"minRefreshInterval"];

    $043343F9A094FB3D6889D8E028CD7DF8 v38 = self->_has;
    if ((*(unsigned char *)&v38 & 2) == 0)
    {
LABEL_64:
      if ((*(_DWORD *)&v38 & 0x40000) == 0) {
        goto LABEL_65;
      }
      goto LABEL_132;
    }
  }
  else if ((*(unsigned char *)&v38 & 2) == 0)
  {
    goto LABEL_64;
  }
  v85 = [NSNumber numberWithLongLong:self->_cloudLastUpdateTime];
  [v4 setObject:v85 forKey:@"cloudLastUpdateTime"];

  $043343F9A094FB3D6889D8E028CD7DF8 v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x40000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v38 & 0x100000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_133;
  }
LABEL_132:
  v86 = [NSNumber numberWithInt:self->_subscriberCount];
  [v4 setObject:v86 forKey:@"subscriberCount"];

  $043343F9A094FB3D6889D8E028CD7DF8 v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x100000) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v38 & 0x80000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
LABEL_133:
  v87 = [NSNumber numberWithInt:self->_subscriberPlayCount];
  [v4 setObject:v87 forKey:@"subscriberPlayCount"];

  if ((*(void *)&self->_has & 0x80000) != 0)
  {
LABEL_67:
    char v39 = [NSNumber numberWithInt:self->_subscriberLikedCount];
    [v4 setObject:v39 forKey:@"subscriberLikedCount"];
  }
LABEL_68:
  subscriberURL = self->_subscriberURL;
  if (subscriberURL) {
    [v4 setObject:subscriberURL forKey:@"subscriberURL"];
  }
  playlistDescription = self->_playlistDescription;
  if (playlistDescription) {
    [v4 setObject:playlistDescription forKey:@"playlistDescription"];
  }
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if (cloudUniversalLibraryId) {
    [v4 setObject:cloudUniversalLibraryId forKey:@"cloudUniversalLibraryId"];
  }
  if (*((unsigned char *)&self->_has + 2))
  {
    uint64_t v43 = [NSNumber numberWithInt:self->_secondaryArtworkSourceType];
    [v4 setObject:v43 forKey:@"secondaryArtworkSourceType"];
  }
  secondaryArtworkId = self->_secondaryArtworkId;
  if (secondaryArtworkId) {
    [v4 setObject:secondaryArtworkId forKey:@"secondaryArtworkId"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    uint64_t v45 = [NSNumber numberWithInt:self->_playlistCategoryTypeMask];
    [v4 setObject:v45 forKey:@"playlistCategoryTypeMask"];
  }
  playlistGroupingSortKey = self->_playlistGroupingSortKey;
  if (playlistGroupingSortKey) {
    [v4 setObject:playlistGroupingSortKey forKey:@"playlistGroupingSortKey"];
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v47 = self->_has;
  if ((*(unsigned char *)&v47 & 0x20) != 0)
  {
    $043343F9A094FB3D6889D8E028CD7DF8 v48 = [NSNumber numberWithLongLong:self->_likedStateChangedDate];
    [v4 setObject:v48 forKey:@"likedStateChangedDate"];

    $043343F9A094FB3D6889D8E028CD7DF8 v47 = self->_has;
  }
  if ((*(_DWORD *)&v47 & 0x200000) != 0)
  {
    uint64_t v49 = [NSNumber numberWithInt:self->_traits];
    [v4 setObject:v49 forKey:@"traits"];
  }
  coverArtworkRecipe = self->_coverArtworkRecipe;
  if (coverArtworkRecipe) {
    [v4 setObject:coverArtworkRecipe forKey:@"coverArtworkRecipe"];
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x40000000) != 0)
  {
    uint64_t v52 = [NSNumber numberWithBool:self->_isCollaborative];
    [v4 setObject:v52 forKey:@"isCollaborative"];

    $043343F9A094FB3D6889D8E028CD7DF8 v51 = self->_has;
  }
  if ((*(_WORD *)&v51 & 0x200) != 0)
  {
    NSUInteger v53 = [NSNumber numberWithInt:self->_collaborationMode];
    [v4 setObject:v53 forKey:@"collaborationMode"];
  }
  collaborationInvitationURL = self->_collaborationInvitationURL;
  if (collaborationInvitationURL) {
    [v4 setObject:collaborationInvitationURL forKey:@"collaborationInvitationURL"];
  }
  $043343F9A094FB3D6889D8E028CD7DF8 v55 = self->_has;
  if ((*(unsigned char *)&v55 & 4) != 0)
  {
    v88 = [NSNumber numberWithLongLong:self->_collaborationInvitationURLExpirationDate];
    [v4 setObject:v88 forKey:@"collaborationInvitationURLExpirationDate"];

    $043343F9A094FB3D6889D8E028CD7DF8 v55 = self->_has;
    if ((*(_DWORD *)&v55 & 0x4000000) == 0)
    {
LABEL_96:
      if ((*(_WORD *)&v55 & 0x400) == 0) {
        goto LABEL_98;
      }
      goto LABEL_97;
    }
  }
  else if ((*(_DWORD *)&v55 & 0x4000000) == 0)
  {
    goto LABEL_96;
  }
  v89 = [NSNumber numberWithBool:self->_collaborationJoinRequestPending];
  [v4 setObject:v89 forKey:@"collaborationJoinRequestPending"];

  if ((*(void *)&self->_has & 0x400) != 0)
  {
LABEL_97:
    uint64_t v56 = [NSNumber numberWithInt:self->_collaboratorStatus];
    [v4 setObject:v56 forKey:@"collaboratorStatus"];
  }
LABEL_98:
  if ([(NSMutableArray *)self->_childIdentifiers count])
  {
    uint64_t v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_childIdentifiers, "count"));
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    uint64_t v58 = self->_childIdentifiers;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v94 objects:v99 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v60; ++i)
        {
          if (*(void *)v95 != v61) {
            objc_enumerationMutation(v58);
          }
          uint64_t v63 = [*(id *)(*((void *)&v94 + 1) + 8 * i) dictionaryRepresentation];
          [v57 addObject:v63];
        }
        uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v94 objects:v99 count:16];
      }
      while (v60);
    }

    [v4 setObject:v57 forKey:@"childIdentifiers"];
  }
  if ([(NSMutableArray *)self->_items count])
  {
    uint64_t v64 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    uint64_t v65 = self->_items;
    uint64_t v66 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v90 objects:v98 count:16];
    if (v66)
    {
      uint64_t v67 = v66;
      uint64_t v68 = *(void *)v91;
      do
      {
        for (uint64_t j = 0; j != v67; ++j)
        {
          if (*(void *)v91 != v68) {
            objc_enumerationMutation(v65);
          }
          long long v70 = [*(id *)(*((void *)&v90 + 1) + 8 * j) dictionaryRepresentation];
          [v64 addObject:v70];
        }
        uint64_t v67 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v90 objects:v98 count:16];
      }
      while (v67);
    }

    [v4 setObject:v64 forKey:@"items"];
  }
  id v71 = v4;

  return v71;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MIPPlaylist;
  id v4 = [(MIPPlaylist *)&v8 description];
  uint64_t v5 = [(MIPPlaylist *)self dictionaryRepresentation];
  $043343F9A094FB3D6889D8E028CD7DF8 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)itemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_items objectAtIndex:a3];
}

- (unint64_t)itemsCount
{
  return [(NSMutableArray *)self->_items count];
}

- (void)addItems:(id)a3
{
  id v4 = a3;
  items = self->_items;
  id v8 = v4;
  if (!items)
  {
    $043343F9A094FB3D6889D8E028CD7DF8 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    $043343F9A094FB3D6889D8E028CD7DF8 v7 = self->_items;
    self->_items = v6;

    id v4 = v8;
    items = self->_items;
  }
  [(NSMutableArray *)items addObject:v4];
}

- (void)clearItems
{
}

- (id)childIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_childIdentifiers objectAtIndex:a3];
}

- (unint64_t)childIdentifiersCount
{
  return [(NSMutableArray *)self->_childIdentifiers count];
}

- (void)addChildIdentifiers:(id)a3
{
  id v4 = a3;
  childIdentifiers = self->_childIdentifiers;
  id v8 = v4;
  if (!childIdentifiers)
  {
    $043343F9A094FB3D6889D8E028CD7DF8 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    $043343F9A094FB3D6889D8E028CD7DF8 v7 = self->_childIdentifiers;
    self->_childIdentifiers = v6;

    id v4 = v8;
    childIdentifiers = self->_childIdentifiers;
  }
  [(NSMutableArray *)childIdentifiers addObject:v4];
}

- (void)clearChildIdentifiers
{
}

- (BOOL)hasCollaboratorStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasCollaboratorStatus:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (void)setCollaboratorStatus:(int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_collaboratorStatus = a3;
}

- (BOOL)hasCollaborationJoinRequestPending
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasCollaborationJoinRequestPending:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (void)setCollaborationJoinRequestPending:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_collaborationJoinRequestPending = a3;
}

- (BOOL)hasCollaborationInvitationURLExpirationDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasCollaborationInvitationURLExpirationDate:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (void)setCollaborationInvitationURLExpirationDate:(int64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_collaborationInvitationURLExpirationDate = a3;
}

- (BOOL)hasCollaborationInvitationURL
{
  return self->_collaborationInvitationURL != 0;
}

- (BOOL)hasCollaborationMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasCollaborationMode:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (void)setCollaborationMode:(int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_collaborationMode = a3;
}

- (BOOL)hasIsCollaborative
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setHasIsCollaborative:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (void)setIsCollaborative:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_isCollaborative = a3;
}

- (BOOL)hasCoverArtworkRecipe
{
  return self->_coverArtworkRecipe != 0;
}

- (BOOL)hasTraits
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasTraits:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (void)setTraits:(int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_traits = a3;
}

- (BOOL)hasLikedStateChangedDate
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasLikedStateChangedDate:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (void)setLikedStateChangedDate:(int64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_likedStateChangedDate = a3;
}

- (BOOL)hasPlaylistGroupingSortKey
{
  return self->_playlistGroupingSortKey != 0;
}

- (BOOL)hasPlaylistCategoryTypeMask
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasPlaylistCategoryTypeMask:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (void)setPlaylistCategoryTypeMask:(int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_playlistCategoryTypeMask = a3;
}

- (BOOL)hasSecondaryArtworkId
{
  return self->_secondaryArtworkId != 0;
}

- (BOOL)hasSecondaryArtworkSourceType
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHasSecondaryArtworkSourceType:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (void)setSecondaryArtworkSourceType:(int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_secondaryArtworkSourceType = a3;
}

- (BOOL)hasCloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId != 0;
}

- (BOOL)hasPlaylistDescription
{
  return self->_playlistDescription != 0;
}

- (BOOL)hasSubscriberURL
{
  return self->_subscriberURL != 0;
}

- (BOOL)hasSubscriberLikedCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasSubscriberLikedCount:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (void)setSubscriberLikedCount:(int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_subscriberLikedCount = a3;
}

- (BOOL)hasSubscriberPlayCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasSubscriberPlayCount:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (void)setSubscriberPlayCount:(int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_subscriberPlayCount = a3;
}

- (BOOL)hasSubscriberCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasSubscriberCount:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (void)setSubscriberCount:(int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_subscriberCount = a3;
}

- (BOOL)hasCloudLastUpdateTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasCloudLastUpdateTime:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (void)setCloudLastUpdateTime:(int64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_cloudLastUpdateTime = a3;
}

- (BOOL)hasMinRefreshInterval
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasMinRefreshInterval:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (void)setMinRefreshInterval:(int64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_minRefreshInterval = a3;
}

- (BOOL)hasAuthorHandle
{
  return self->_authorHandle != 0;
}

- (BOOL)hasAuthorStoreURL
{
  return self->_authorStoreURL != 0;
}

- (BOOL)hasAuthorDisplayName
{
  return self->_authorDisplayName != 0;
}

- (BOOL)hasAuthorStoreId
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasAuthorStoreId:(BOOL)a3
{
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (void)setAuthorStoreId:(int64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_authorStoreId = a3;
}

- (BOOL)hasVisible
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setHasVisible:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (void)setVisible:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_visible = a3;
}

- (BOOL)hasShared
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setHasShared:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (void)setShared:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_shared = a3;
}

- (BOOL)hasPlayCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasPlayCount:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (void)setPlayCount:(int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_playCount = a3;
}

- (BOOL)hasEditable
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasEditable:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (void)setEditable:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_editable = a3;
}

- (BOOL)hasOwner
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setHasOwner:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (void)setOwner:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_owner = a3;
}

- (BOOL)hasRemoteSourceType
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasRemoteSourceType:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (void)setRemoteSourceType:(int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_remoteSourceType = a3;
}

- (BOOL)hasLikedState
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasLikedState:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (void)setLikedState:(int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_likedState = a3;
}

- (BOOL)hasArtworkId
{
  return self->_artworkId != 0;
}

- (BOOL)hasCloudVersionHash
{
  return self->_cloudVersionHash != 0;
}

- (BOOL)hasCloudIsSharingDisabled
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setHasCloudIsSharingDisabled:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (void)setCloudIsSharingDisabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_cloudIsSharingDisabled = a3;
}

- (BOOL)hasLastPlayedDateTime
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasLastPlayedDateTime:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (void)setLastPlayedDateTime:(int64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_lastPlayedDateTime = a3;
}

- (BOOL)hasModificationDateTime
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasModificationDateTime:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (void)setModificationDateTime:(int64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_modificationDateTime = a3;
}

- (BOOL)hasCreationDateTime
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasCreationDateTime:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (void)setCreationDateTime:(int64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_creationDateTime = a3;
}

- (BOOL)hasExternalVendorPlaylist
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setHasExternalVendorPlaylist:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (void)setExternalVendorPlaylist:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_externalVendorPlaylist = a3;
}

- (BOOL)hasExternalVendorTag
{
  return self->_externalVendorTag != 0;
}

- (BOOL)hasExternalVendorDisplayName
{
  return self->_externalVendorDisplayName != 0;
}

- (BOOL)hasExternalVendorIdentifier
{
  return self->_externalVendorIdentifier != 0;
}

- (BOOL)hasCloudIsCuratorPlaylist
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasCloudIsCuratorPlaylist:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (void)setCloudIsCuratorPlaylist:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_cloudIsCuratorPlaylist = a3;
}

- (BOOL)hasCloudIsSubscribed
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasCloudIsSubscribed:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (void)setCloudIsSubscribed:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_cloudIsSubscribed = a3;
}

- (BOOL)hasCloudGlobalId
{
  return self->_cloudGlobalId != 0;
}

- (BOOL)hasDistinguishedKind
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasDistinguishedKind:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (void)setDistinguishedKind:(int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_distinguishedKind = a3;
}

- (BOOL)hasGeniusSeedTrackIdentifier
{
  return self->_geniusSeedTrackIdentifier != 0;
}

- (BOOL)hasParentIdentifier
{
  return self->_parentIdentifier != 0;
}

- (BOOL)hasReversedSorting
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setHasReversedSorting:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (void)setReversedSorting:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_reversedSorting = a3;
}

- (int)StringAsSortType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Artist"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Album"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Name"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ReleaseDate"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AddedDate"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PlayedDate"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SeriesName"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Physical"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Shuffle"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"TrackID"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"PlaylistItemID"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"BitRate"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"Genre"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"Kind"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"Date"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"TrackNumber"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"TotalSize"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"TotalTime"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"Year"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SampleRate"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"Category"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"Location"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"StreamStatus"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"Description"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"Comment"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"DateAdded"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"EQPreset"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"Composer"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"NormVolume"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"UserPlayCount"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"PlayDate"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"DiscNumber"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"TrackRating"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"CompilationArtist"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"CompilationGenre"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"FastArtist"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"FastAlbumArtistOrArtist"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"FastAlbum"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"FastGenre"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"FastComposer"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"Price"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"Relevance"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"PurchaseDate"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"BeatsPerMinute"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"Popularity"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"Grouping"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"SeasonNumber"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"EpisodeID"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"EpisodeSortID"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"UserSkipCount"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"SkipDate"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"AlbumArtist"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"AlbumByArtistYear"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"AlbumByArtist"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"AlbumRating"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"RentalExpirationDate"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"ComposerAlbum"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"CategoryAlbum"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"GenreAlbum"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"GenreName"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"GeniusID"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"PodcastCategory"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"StorePersistentID"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"Version"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"UncompressedSize"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"AppKind"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"UserDisabled"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"CloudDownload"])
  {
    int v4 = 68;
  }
  else if ([v3 isEqualToString:@"CloudMatchState"])
  {
    int v4 = 69;
  }
  else if ([v3 isEqualToString:@"CloudID"])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:@"CloudUserID"])
  {
    int v4 = 71;
  }
  else if ([v3 isEqualToString:@"CloudStatus"])
  {
    int v4 = 72;
  }
  else if ([v3 isEqualToString:@"CloudFlavorID"])
  {
    int v4 = 73;
  }
  else if ([v3 isEqualToString:@"CloudLibraryKind"])
  {
    int v4 = 74;
  }
  else if ([v3 isEqualToString:@"Tags"])
  {
    int v4 = 75;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)sortTypeAsString:(int)a3
{
  if (a3 >= 0x4C)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5FB5348[a3];
  }

  return v3;
}

- (BOOL)hasSortType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasSortType:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (void)setSortType:(int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_uint64_t sortType = a3;
}

- (int)sortType
{
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    return self->_sortType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasSmartPlaylistInfo
{
  return self->_smartPlaylistInfo != 0;
}

- (BOOL)hasHidden
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHasHidden:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (void)setHidden:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_hidden = a3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Normal"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Smart"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Genius"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Folder"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5FB5328[a3 - 1];
  }

  return v3;
}

- (BOOL)hasType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasType:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (void)setType:(int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_type = a3;
}

- (int)type
{
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (BOOL)hasStoreId
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHasStoreId:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$043343F9A094FB3D6889D8E028CD7DF8 has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (void)setStoreId:(int64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_storeId = a3;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

+ (Class)itemsType
{
  return (Class)objc_opt_class();
}

+ (Class)childIdentifiersType
{
  return (Class)objc_opt_class();
}

@end