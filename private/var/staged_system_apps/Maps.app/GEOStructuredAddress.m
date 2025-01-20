@interface GEOStructuredAddress
- (id)_cellContent_subtitleWithTitle:(id)a3;
- (id)localityWithFallback:(BOOL)a3;
@end

@implementation GEOStructuredAddress

- (id)_cellContent_subtitleWithTitle:(id)a3
{
  id v4 = a3;
  v5 = [(GEOStructuredAddress *)self administrativeArea];
  if ([v5 length]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  v7 = [(GEOStructuredAddress *)self country];
  uint64_t v8 = [v6 uppercaseString];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [v4 uppercaseString];
    v11 = [v6 uppercaseString];
    if (![v10 isEqualToString:v11] && objc_msgSend(v6, "length"))
    {

LABEL_13:
      goto LABEL_14;
    }
    id v12 = [v7 length];

    if (!v12) {
      goto LABEL_14;
    }
LABEL_12:
    v9 = v6;
    id v6 = v7;
    goto LABEL_13;
  }
  if (![v6 length] && objc_msgSend(v7, "length")) {
    goto LABEL_12;
  }
LABEL_14:
  id v13 = v6;

  return v13;
}

- (id)localityWithFallback:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(GEOStructuredAddress *)self hasLocality])
  {
    v5 = [(GEOStructuredAddress *)self locality];
  }
  else if (v3)
  {
    if ([(GEOStructuredAddress *)self hasSubAdministrativeArea])
    {
      v5 = [(GEOStructuredAddress *)self subAdministrativeArea];
    }
    else
    {
      if ([(GEOStructuredAddress *)self hasAdministrativeArea]) {
        [(GEOStructuredAddress *)self administrativeArea];
      }
      else {
      v5 = [(GEOStructuredAddress *)self country];
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end