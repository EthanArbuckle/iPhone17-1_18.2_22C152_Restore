@interface MBFSEventReader
- (BOOL)_handleNumEvents:(unint64_t)a3 eventPaths:(id)a4 eventFlags:(const unsigned int *)a5 eventIDs:(const unint64_t *)a6;
- (MBDomainMarker)domainMarker;
- (MBFSEventReader)initWithDomainMarker:(id)a3 pathToMonitor:(id)a4 pathToModifiedDomainFlags:(id)a5 pathToDomainMapping:(id)a6;
- (NSDictionary)pathToDomainMapping;
- (NSDictionary)pathToModifiedDomainFlags;
- (NSString)pathToMonitor;
- (id)_domainFromPath:(id)a3 requiresScan:(BOOL *)a4;
- (unint64_t)eventsCollected;
- (unint64_t)eventsSkipped;
- (unint64_t)modifiedDomainsFlags;
- (unint64_t)scanAllDomainsFlags;
- (void)_handleEventPath:(id)a3 flags:(unsigned int)a4;
- (void)setEventsCollected:(unint64_t)a3;
- (void)setEventsSkipped:(unint64_t)a3;
- (void)setModifiedDomainsFlags:(unint64_t)a3;
@end

@implementation MBFSEventReader

- (MBFSEventReader)initWithDomainMarker:(id)a3 pathToMonitor:(id)a4 pathToModifiedDomainFlags:(id)a5 pathToDomainMapping:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MBFSEventReader;
  v15 = [(MBFSEventReader *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_domainMarker, a3);
    objc_storeStrong((id *)&v16->_pathToMonitor, a4);
    objc_storeStrong((id *)&v16->_pathToModifiedDomainFlags, a5);
    objc_storeStrong((id *)&v16->_pathToDomainMapping, a6);
    v17 = [v13 objectForKeyedSubscript:&stru_100418BA8];
    v16->_scanAllDomainsFlags = [v17 unsignedIntValue];
  }
  return v16;
}

- (BOOL)_handleNumEvents:(unint64_t)a3 eventPaths:(id)a4 eventFlags:(const unsigned int *)a5 eventIDs:(const unint64_t *)a6
{
  id v9 = a4;
  if (!a3)
  {
LABEL_11:
    BOOL v12 = 1;
    goto LABEL_12;
  }
  if ((*(unsigned char *)a5 & 0x10) == 0)
  {
    id v11 = [(MBFSEventReader *)self modifiedDomainsFlags];
    if (v11 != (void *)[(MBFSEventReader *)self scanAllDomainsFlags])
    {
      uint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = v13;
        v15 = [v9 objectAtIndexedSubscript:v13];
        [(MBFSEventReader *)self _handleEventPath:v15 flags:a5[v14]];

        if (a3 - 1 == v14) {
          goto LABEL_11;
        }
        if ((a5[v14 + 1] & 0x10) == 0)
        {
          unint64_t v16 = [(MBFSEventReader *)self modifiedDomainsFlags];
          unint64_t v17 = [(MBFSEventReader *)self scanAllDomainsFlags];
          uint64_t v13 = v14 + 1;
          if (v16 != v17) {
            continue;
          }
        }
        BOOL v12 = v14 + 1 >= a3;
        goto LABEL_5;
      }
    }
  }
  BOOL v12 = 0;
LABEL_5:
LABEL_12:

  return v12;
}

- (void)_handleEventPath:(id)a3 flags:(unsigned int)a4
{
  v5 = [a3 stringByStandardizingPath];
  if ([v5 hasPrefix:@"/private/var"])
  {
    uint64_t v6 = [v5 substringFromIndex:objc_msgSend(@"/private", "length")];

    v5 = (void *)v6;
  }
  char v21 = 0;
  uint64_t v7 = [(MBFSEventReader *)self _domainFromPath:v5 requiresScan:&v21];
  v8 = (void *)v7;
  if (!v7 || !v21)
  {
    if (v7)
    {
      uint64_t v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = [v8 name];
        *(_DWORD *)buf = 138412546;
        v23 = v14;
        __int16 v24 = 2112;
        v25 = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Skipping FSEvent for %@ %@", buf, 0x16u);

        objc_super v19 = [v8 name];
        v20 = v5;
        _MBLog();
      }
    }
    else
    {
      v15 = [(MBFSEventReader *)self pathToModifiedDomainFlags];
      unint64_t v16 = [v15 objectForKeyedSubscript:v5];
      unsigned int v17 = [v16 unsignedIntValue];

      if (v17)
      {
        v18 = (void *)v17;
        if ((~[(MBFSEventReader *)self modifiedDomainsFlags] & v17) != 0)
        {
          [(MBFSEventReader *)self setModifiedDomainsFlags:[(MBFSEventReader *)self modifiedDomainsFlags] | v17];
          id v11 = MBGetDefaultLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v23 = v18;
            __int16 v24 = 2112;
            v25 = v5;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Adding scan flags 0x%lx for FSEvent path %@", buf, 0x16u);
            objc_super v19 = v18;
            v20 = v5;
            _MBLog();
          }
          goto LABEL_7;
        }
      }
      uint64_t v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Skipping FSEvent for path not in any domain %@", buf, 0xCu);
        objc_super v19 = v5;
        _MBLog();
      }
    }

    [(MBFSEventReader *)self setEventsSkipped:(char *)[(MBFSEventReader *)self eventsSkipped] + 1];
    goto LABEL_16;
  }
  id v9 = [(MBFSEventReader *)self domainMarker];
  v10 = [v8 name];
  [v9 markModifiedDomain:v10];

  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = [v8 name];
    *(_DWORD *)buf = 138412546;
    v23 = v12;
    __int16 v24 = 2112;
    v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Marked domain %@ to be scanned, FSEvent path %@", buf, 0x16u);

    objc_super v19 = [v8 name];
    v20 = v5;
    _MBLog();
  }
LABEL_7:

LABEL_16:
  [(MBFSEventReader *)self setEventsCollected:(char *)[(MBFSEventReader *)self eventsCollected] + 1];
}

- (id)_domainFromPath:(id)a3 requiresScan:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MBFSEventReader *)self pathToDomainMapping];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];
  if (v8)
  {
    id v9 = (id)v8;
    v10 = v6;
LABEL_7:

    uint64_t v13 = [(MBFSEventReader *)self domainMarker];
    uint64_t v14 = [v9 name];
    unsigned __int8 v15 = [v13 isDomainMarkedAsModified:v14];

    if (v15)
    {
      unsigned __int8 v16 = 0;
    }
    else if ([v10 isEqualToString:v6])
    {
      unsigned __int8 v16 = 1;
    }
    else
    {
      unsigned int v17 = [v9 rootPathRelativeToVolumeMountPoint];
      v18 = objc_msgSend(v6, "substringFromIndex:", (char *)objc_msgSend(v17, "length") + 1);

      unsigned __int8 v16 = [v9 shouldBackUpAnyChildOfRelativePath:v18];
    }
    id v11 = v10;
  }
  else
  {
    id v11 = v6;
    while (1)
    {
      id v9 = [v11 length];

      if (!v9) {
        break;
      }
      v10 = [v11 stringByDeletingLastPathComponent];

      uint64_t v7 = [(MBFSEventReader *)self pathToDomainMapping];
      uint64_t v12 = [v7 objectForKeyedSubscript:v10];
      id v11 = v10;
      if (v12)
      {
        id v9 = (id)v12;
        goto LABEL_7;
      }
    }
    unsigned __int8 v16 = 0;
  }
  *a4 = v16;

  return v9;
}

- (MBDomainMarker)domainMarker
{
  return self->_domainMarker;
}

- (NSString)pathToMonitor
{
  return self->_pathToMonitor;
}

- (NSDictionary)pathToModifiedDomainFlags
{
  return self->_pathToModifiedDomainFlags;
}

- (unint64_t)scanAllDomainsFlags
{
  return self->_scanAllDomainsFlags;
}

- (NSDictionary)pathToDomainMapping
{
  return self->_pathToDomainMapping;
}

- (unint64_t)modifiedDomainsFlags
{
  return self->_modifiedDomainsFlags;
}

- (void)setModifiedDomainsFlags:(unint64_t)a3
{
  self->_modifiedDomainsFlags = a3;
}

- (unint64_t)eventsCollected
{
  return self->_eventsCollected;
}

- (void)setEventsCollected:(unint64_t)a3
{
  self->_eventsCollected = a3;
}

- (unint64_t)eventsSkipped
{
  return self->_eventsSkipped;
}

- (void)setEventsSkipped:(unint64_t)a3
{
  self->_eventsSkipped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathToDomainMapping, 0);
  objc_storeStrong((id *)&self->_pathToModifiedDomainFlags, 0);
  objc_storeStrong((id *)&self->_pathToMonitor, 0);
  objc_storeStrong((id *)&self->_domainMarker, 0);
}

@end