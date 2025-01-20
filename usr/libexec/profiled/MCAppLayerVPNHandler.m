@interface MCAppLayerVPNHandler
- (id)installService:(id)a3;
@end

@implementation MCAppLayerVPNHandler

- (id)installService:(id)a3
{
  id v4 = a3;
  v5 = [(MCNewPayloadHandler *)self payload];
  id v6 = v4;
  v7 = [v5 VPNUUID];
  v8 = [v5 SafariDomains];
  unsigned __int8 v9 = [v6 setPerAppUUID:v7 andSafariDomains:v8];

  if (v9)
  {
    v10 = [v5 SMBDomains];
    unsigned __int8 v11 = [v6 setSMBDomains:v10];

    if (v11)
    {
      v12 = [v5 mailDomains];
      unsigned __int8 v13 = [v6 setMailDomains:v12];

      if (v13)
      {
        v14 = [v5 calendarDomains];
        unsigned __int8 v15 = [v6 setCalendarDomains:v14];

        if (v15)
        {
          v16 = [v5 contactsDomains];
          unsigned __int8 v17 = [v6 setContactsDomains:v16];

          if (v17)
          {
            if (objc_msgSend(v6, "setRestrictDomains:", objc_msgSend(v5, "restrictDomains")))
            {
              v18 = [v5 associatedDomains];
              unsigned __int8 v19 = [v6 setAssociatedDomains:v18];

              if (v19)
              {
                v20 = [v5 excludedDomains];
                unsigned __int8 v21 = [v6 setExcludedDomains:v20];

                if (v21)
                {
                  v22 = 0;
                  goto LABEL_34;
                }
                v30 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Could not set per-app VPN excluded domains", buf, 2u);
                }
              }
              else
              {
                v29 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Could not set per-app VPN associated domains", buf, 2u);
                }
              }
            }
            else
            {
              v28 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Could not set per-app VPN domain restrictions", buf, 2u);
              }
            }
          }
          else
          {
            v27 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Could not set per-app VPN contacts domains", buf, 2u);
            }
          }
        }
        else
        {
          v26 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Could not set per-app VPN calendar domains", buf, 2u);
          }
        }
      }
      else
      {
        v25 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Could not set per-app VPN mail domains", buf, 2u);
        }
      }
    }
    else
    {
      v24 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Could not set per-app VPN SMBDomains", buf, 2u);
      }
    }
  }
  else
  {
    v23 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Could not add Safari App VPN rules", buf, 2u);
    }
  }
  uint64_t v31 = MCVPNErrorDomain;
  v32 = [(MCNewPayloadHandler *)self payload];
  v33 = [v32 displayName];
  v34 = MCErrorArray();
  v22 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v31, 15000, v34, MCErrorTypeFatal, v33, 0);

LABEL_34:

  return v22;
}

@end