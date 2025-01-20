@interface MapsSuggestionsShortcut
- (id)styleAttributes;
@end

@implementation MapsSuggestionsShortcut

- (id)styleAttributes
{
  switch((unint64_t)[(MapsSuggestionsShortcut *)self type])
  {
    case 2uLL:
      uint64_t v3 = +[GEOFeatureStyleAttributes homeStyleAttributes];
      goto LABEL_7;
    case 3uLL:
      uint64_t v3 = +[GEOFeatureStyleAttributes workStyleAttributes];
      goto LABEL_7;
    case 5uLL:
      uint64_t v3 = +[GEOFeatureStyleAttributes schoolStyleAttributes];
      goto LABEL_7;
    case 6uLL:
      v4 = [(MapsSuggestionsShortcut *)self identifier];
      unsigned int v5 = [v4 isEqualToString:@"NearbyTransit"];

      if (!v5) {
        goto LABEL_8;
      }
      uint64_t v3 = +[GEOFeatureStyleAttributes nearbyTransitStyleAttributes];
LABEL_7:
      v6 = (void *)v3;
      break;
    default:
LABEL_8:
      v7 = [(MapsSuggestionsShortcut *)self geoMapItem];
      v8 = v7;
      if (!v7 || ([v7 _styleAttributes], (v6 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v6 = +[GEOFeatureStyleAttributes markerStyleAttributes];
      }

      break;
  }

  return v6;
}

@end