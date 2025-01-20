@interface GEOComposedWaypoint(MNExtras)
- (id)_spokenPlaceName;
- (id)bestDisplayName:()MNExtras;
- (id)bestSpokenName;
- (id)directionsListAddress;
- (id)humanDescription;
- (id)humanDescriptionWithAddressAndLatLng;
- (id)humanDescriptionWithLatLng;
- (id)localeIdentifier;
- (id)navAnnouncementAddressAndSubstituteType:()MNExtras;
- (id)navAnnouncementNameAndSubstituteType:()MNExtras;
- (id)navDisplayAddress;
- (id)navDisplayAddressAndSubstituteType:()MNExtras;
- (id)navDisplayNameAndSubstituteType:()MNExtras;
- (id)navDisplayNameWithSpecialContacts:()MNExtras;
- (id)navDisplayNameWithSpecialContacts:()MNExtras substituteType:;
- (uint64_t)navAnnouncementAddress;
- (uint64_t)navAnnouncementName;
- (uint64_t)navDisplayName;
@end

@implementation GEOComposedWaypoint(MNExtras)

- (id)bestDisplayName:()MNExtras
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = [a1 waypointCategory];
  v6 = 0;
  switch(v5)
  {
    case 0:
      v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315650;
        v10 = "-[GEOComposedWaypoint(MNExtras) bestDisplayName:]";
        __int16 v11 = 2080;
        v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/GEOComposedWaypoint+MNExtras.m";
        __int16 v13 = 1024;
        int v14 = 56;
        _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v9, 0x1Cu);
      }

      goto LABEL_2;
    case 1:
    case 2:
    case 6:
    case 9:
    case 10:
    case 12:
LABEL_2:
      v6 = [a1 navDisplayName];
      break;
    case 3:
    case 4:
    case 5:
    case 11:
      v6 = [a1 navDisplayNameWithSpecialContacts:a3];
      break;
    case 7:
      v6 = [a1 navDisplayAddress];
      break;
    default:
      break;
  }
  return v6;
}

- (id)bestSpokenName
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  switch([a1 waypointCategory])
  {
    case 0u:
    case 8u:
      v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136315650;
        v8 = "-[GEOComposedWaypoint(MNExtras) bestSpokenName]";
        __int16 v9 = 2080;
        v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/GEOComposedWaypoint+MNExtras.m";
        __int16 v11 = 1024;
        int v12 = 87;
        _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v7, 0x1Cu);
      }

      uint64_t v5 = [a1 navAnnouncementName];
      goto LABEL_9;
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
      v2 = [a1 geoMapItem];
      v3 = [v2 contactSpokenName];

      break;
    case 6u:
      uint64_t v5 = [a1 _spokenPlaceName];
      goto LABEL_9;
    case 7u:
      uint64_t v5 = [a1 navAnnouncementAddress];
LABEL_9:
      v3 = (void *)v5;
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (id)directionsListAddress
{
  v2 = [a1 geoMapItem];

  if (v2)
  {
    v3 = [a1 geoMapItem];
    v4 = [v3 addressObject];
    uint64_t v5 = [v4 fullAddressWithMultiline:0];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)navDisplayAddress
{
  v2 = [a1 geoMapItem];

  if (v2)
  {
    v3 = [a1 geoMapItem];
    v4 = navDisplayAddressForMapItem(v3, 0);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (uint64_t)navDisplayName
{
  return [a1 navDisplayNameWithSpecialContacts:1 substituteType:0];
}

- (id)navDisplayAddressAndSubstituteType:()MNExtras
{
  v4 = [a1 geoMapItem];
  uint64_t v5 = navDisplayAddressForMapItem(v4, a3);

  return v5;
}

- (id)navDisplayNameAndSubstituteType:()MNExtras
{
  uint64_t v5 = [a1 geoMapItem];

  if (v5) {
    [a1 navDisplayNameWithSpecialContacts:1 substituteType:a3];
  }
  else {
  v6 = [a1 name];
  }
  return v6;
}

- (id)navDisplayNameWithSpecialContacts:()MNExtras
{
  v4 = [a1 geoMapItem];
  uint64_t v5 = navDisplayNameForMapItem(v4, a3, 0);

  return v5;
}

- (id)navDisplayNameWithSpecialContacts:()MNExtras substituteType:
{
  int v7 = [a1 geoMapItem];

  if (v7)
  {
    v8 = [a1 geoMapItem];
    __int16 v9 = navDisplayNameForMapItem(v8, a3, a4);
  }
  else
  {
    __int16 v9 = [a1 name];
  }
  return v9;
}

- (id)localeIdentifier
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  int v1 = objc_msgSend(v0, "_navigation_isNavd");

  if (v1)
  {
    v2 = +[MNUserOptionsEngine sharedInstance];
    [v2 currentVoiceLanguage];
  }
  else
  {
    v2 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v2 localeIdentifier];
  v3 = };

  return v3;
}

- (uint64_t)navAnnouncementName
{
  return [a1 navAnnouncementNameAndSubstituteType:0];
}

- (id)navAnnouncementNameAndSubstituteType:()MNExtras
{
  uint64_t v5 = [a1 geoMapItem];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 contactSpokenName];
    if ([v7 length])
    {
      if (a3) {
        *a3 = 3;
      }
      goto LABEL_12;
    }
  }
  v8 = [a1 _spokenPlaceName];
  if ([v8 length])
  {
    if (a3) {
      *a3 = 4;
    }
    id v7 = v8;
  }
  else
  {
    id v7 = 0;
  }

LABEL_12:
  return v7;
}

- (uint64_t)navAnnouncementAddress
{
  return [a1 navAnnouncementAddressAndSubstituteType:0];
}

- (id)navAnnouncementAddressAndSubstituteType:()MNExtras
{
  uint64_t v5 = [a1 geoMapItem];
  if (v5)
  {
    v6 = [a1 localeIdentifier];
    id v7 = [v5 _spokenAddressForLocale:v6];

    if ([v7 length])
    {
      if (a3) {
        *a3 = 2;
      }
      uint64_t v8 = objc_msgSend(v7, "_navigation_stringByMarkingAsNormalText");
LABEL_12:
      __int16 v9 = (void *)v8;

      goto LABEL_16;
    }
  }
  if ([MEMORY[0x1E4F64540] canSpeakWrittenAddresses])
  {
    id v7 = [a1 navDisplayAddress];
    if ([v7 length])
    {
      if (a3) {
        *a3 = 2;
      }
      uint64_t v8 = objc_msgSend(v7, "_navigation_stringByMarkingAsAddress");
      goto LABEL_12;
    }
  }
  __int16 v9 = 0;
  if (a3) {
    *a3 = 0;
  }
LABEL_16:

  return v9;
}

- (id)_spokenPlaceName
{
  v2 = [a1 geoMapItem];
  v3 = [a1 localeIdentifier];
  v4 = [v2 spokenNameForLocale:v3];

  if ([v4 length])
  {
    uint64_t v5 = objc_msgSend(v4, "_navigation_stringByMarkingAsNormalText");
    goto LABEL_7;
  }
  if ([MEMORY[0x1E4F64540] canSpeakWrittenPlaceNames])
  {
    uint64_t v5 = [a1 name];
    if ([v5 length]) {
      goto LABEL_7;
    }
  }
  uint64_t v5 = 0;
LABEL_7:

  return v5;
}

- (id)humanDescription
{
  v2 = [a1 geoMapItem];

  if (v2)
  {
    v3 = [a1 navDisplayNameWithSpecialContacts:0];
  }
  else if ([a1 hasLatLng])
  {
    v4 = NSString;
    uint64_t v5 = [a1 latLng];
    [v5 lat];
    uint64_t v7 = v6;
    uint64_t v8 = [a1 latLng];
    [v8 lng];
    v3 = objc_msgSend(v4, "stringWithFormat:", @"(%f,%f)", v7, v9);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)humanDescriptionWithLatLng
{
  v2 = [a1 geoMapItem];

  if (v2)
  {
    v3 = NSString;
    v4 = [a1 navDisplayNameWithSpecialContacts:0];
    uint64_t v5 = [a1 latLng];
    [v5 lat];
    uint64_t v7 = v6;
    uint64_t v8 = [a1 latLng];
    [v8 lng];
    v10 = [v3 stringWithFormat:@"\"%@\" <%f,%f>", v4, v7, v9];
  }
  else
  {
    v10 = [a1 humanDescription];
  }
  return v10;
}

- (id)humanDescriptionWithAddressAndLatLng
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = [a1 navDisplayName];
  uint64_t v4 = [a1 geoMapItem];
  if (v4
    && (uint64_t v5 = (void *)v4,
        [a1 geoMapItem],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 contactAddressType],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = NSString;
    uint64_t v9 = [a1 navDisplayNameWithSpecialContacts:0];
    v10 = [a1 navDisplayNameWithSpecialContacts:1];
    __int16 v11 = [v8 stringWithFormat:@"%@ (%@)", v9, v10];
    [v2 addObject:v11];
  }
  else if (v3)
  {
    [v2 addObject:v3];
  }
  int v12 = [a1 navDisplayAddress];
  if (v12) {
    [v2 addObject:v12];
  }
  uint64_t v13 = NSString;
  int v14 = [a1 latLng];
  [v14 lat];
  uint64_t v16 = v15;
  v17 = [a1 latLng];
  [v17 lng];
  v19 = [v13 stringWithFormat:@"%.6f, %.6f", v16, v18];
  [v2 addObject:v19];

  v20 = [v2 componentsJoinedByString:@" | "];

  return v20;
}

@end