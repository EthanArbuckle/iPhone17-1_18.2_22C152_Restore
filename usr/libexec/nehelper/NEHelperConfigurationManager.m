@interface NEHelperConfigurationManager
- (NEHelperConfigurationManager)initWithFirstMessage:(id)a3;
- (NSString)name;
- (OS_dispatch_queue)handlerQueue;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperConfigurationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_addNotification, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_appGroups, 0);
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v4, "config-operation");
  if (!int64)
  {
    v8 = 0;
    goto LABEL_9;
  }
  int64_t v6 = int64;
  if (xpc_dictionary_get_string(v4, "config-plugin-type"))
  {
    v8 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v4, "config-plugin-type")];
    if (!self) {
      goto LABEL_8;
    }
  }
  else
  {
    v8 = 0;
    if (!self)
    {
LABEL_8:
      sub_100001CA0((uint64_t)NEHelperServer, v4, 10, 0);
      goto LABEL_9;
    }
  }
  if (!self->_entitled) {
    goto LABEL_8;
  }
  if (v6 == 5 && !self->_superEntitled)
  {
    v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = objc_getProperty(self, v10, 64, 1);
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Rejecting fetch-identities operation from non-super-entitled app %@", buf, 0xCu);
    }

    goto LABEL_8;
  }
  if (v8)
  {
    v274 = v8;
    v11 = +[NSArray arrayWithObjects:&v274 count:1];
    [objc_getProperty(self, v12, 56, 1) setObject:v11 forKeyedSubscript:@"plugin-types"];
  }
  else
  {
    [objc_getProperty(self, v7, 56, 1) removeObjectForKey:@"plugin-types"];
  }
  switch(v6)
  {
    case 1:
      v13 = +[NEConfigurationManager sharedManagerForAllUsers];
      id v15 = objc_getProperty(self, v14, 56, 1);
      id Property = objc_getProperty(self, v16, 32, 1);
      v268[0] = _NSConcreteStackBlock;
      v268[1] = 3221225472;
      v268[2] = sub_1000146B0;
      v268[3] = &unk_100039268;
      id v269 = v4;
      [v13 loadIndexWithFilter:v15 completionQueue:Property handler:v268];

      goto LABEL_9;
    case 2:
      v18 = xpc_dictionary_get_value(v4, "config-ids-data");
      v19 = v18;
      if (v18 && xpc_get_type(v18) == (xpc_type_t)&_xpc_type_data)
      {
        id v20 = objc_alloc((Class)NSKeyedUnarchiver);
        bytes_ptr = xpc_data_get_bytes_ptr(v19);
        v22 = +[NSData dataWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v19) freeWhenDone:0];
        id v23 = [v20 initForReadingFromData:v22 error:0];

        uint64_t v24 = objc_opt_class();
        v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v24, objc_opt_class(), 0);
        v26 = [v23 decodeObjectOfClasses:v25 forKey:@"config-identifiers"];

        int v27 = isa_nsarray();
        v28 = ne_log_obj();
        v29 = v28;
        if (v27)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = objc_getProperty(self, v30, 64, 1);
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v26;
            _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%@ fetching configs with IDs: %@", buf, 0x16u);
          }

          v31 = +[NEConfigurationManager sharedManagerForAllUsers];
          id v33 = objc_getProperty(self, v32, 56, 1);
          id v35 = objc_getProperty(self, v34, 32, 1);
          v266[0] = _NSConcreteStackBlock;
          v266[1] = 3221225472;
          v266[2] = sub_1000147A4;
          v266[3] = &unk_100039290;
          id v267 = v4;
          [v31 loadConfigurations:v26 withFilter:v33 completionQueue:v35 completionHandler:v266];
        }
        else
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = objc_getProperty(self, v138, 64, 1);
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v26;
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@ Received invalid config IDs: %@", buf, 0x16u);
          }

          sub_100001CA0((uint64_t)NEHelperServer, v4, 0, 0);
        }
      }
      goto LABEL_9;
    case 3:
      size_t length = 0;
      data = xpc_dictionary_get_data(v4, "config-data", &length);
      size_t v264 = 0;
      v37 = xpc_dictionary_get_data(v4, "config-signature", &v264);
      if (length > 0x80000)
      {
        v39 = ne_log_obj();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          id v143 = objc_getProperty(self, v40, 64, 1);
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v143;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = length;
          _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%@ configuration is too large: %lu", buf, 0x16u);
        }

        sub_100001CA0((uint64_t)NEHelperServer, v4, 2, 0);
        goto LABEL_9;
      }
      v99 = v37;
      v100 = 0;
      if (data && length)
      {
        id v101 = objc_alloc((Class)NSKeyedUnarchiver);
        v102 = +[NSData dataWithBytesNoCopy:data length:length freeWhenDone:0];
        id v103 = [v101 initForReadingFromData:v102 error:0];

        v100 = [v103 decodeObjectOfClass:objc_opt_class() forKey:@"config-object"];
      }
      if (!v99 || !v264)
      {
        if (self->_appGroupEntitled) {
          goto LABEL_123;
        }
        v105 = 0;
LABEL_104:
        if (!objc_msgSend(objc_getProperty(self, v38, 24, 1), "count") || !objc_getProperty(self, v116, 40, 1)) {
          goto LABEL_108;
        }
        v106 = +[NEConfigurationManager sharedManagerForAllUsers];
        id v118 = objc_getProperty(self, v117, 24, 1);
        [v106 addGroups:v118 forApp:[self v119]];

LABEL_107:
        goto LABEL_108;
      }
      uint64_t v104 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v99);
      v105 = (void *)v104;
      if (!self->_appGroupEntitled) {
        goto LABEL_104;
      }
      if (!v104)
      {
LABEL_123:
        v130 = ne_log_obj();
        if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
        {
          id v167 = objc_getProperty(self, v131, 64, 1);
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v167;
          _os_log_error_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_ERROR, "%@ cannot create new configurations because it is only app group entitled", buf, 0xCu);
        }

        sub_100001CA0((uint64_t)NEHelperServer, v4, 10, 0);
        goto LABEL_9;
      }
      v106 = [v100 VPN];
      if (v106) {
        goto LABEL_107;
      }
      v106 = [v100 appVPN];
      if (v106) {
        goto LABEL_107;
      }
      v106 = [v100 contentFilter];
      if (v106) {
        goto LABEL_107;
      }
      v106 = [v100 dnsProxy];
      if (v106) {
        goto LABEL_107;
      }
      v107 = [v100 relay];
      BOOL v108 = v107 == 0;

      if (v108)
      {
        v109 = ne_log_obj();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        {
          v224 = [v100 name];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v224;
          _os_log_error_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "Configuration type of %@ does not allow modification by app group entitled apps", buf, 0xCu);
        }
        sub_100001CA0((uint64_t)NEHelperServer, v4, 10, 0);

        goto LABEL_9;
      }
LABEL_108:
      if (!v100)
      {
        v136 = ne_log_obj();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
        {
          id v183 = objc_getProperty(self, v137, 64, 1);
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v183;
          _os_log_error_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_ERROR, "%@ cannot save a configuration, no configuration provided", buf, 0xCu);
        }

        sub_100001CA0((uint64_t)NEHelperServer, v4, 8, 0);
        goto LABEL_9;
      }
      v120 = [v100 pluginType];
      v121 = v120;
      if (v8)
      {
        if (!v120 || ([v120 isEqualToString:v8] & 1) == 0)
        {
          v122 = ne_log_obj();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
          {
            id v188 = objc_getProperty(self, v123, 64, 1);
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v188;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v121;
            *(_WORD *)&buf[22] = 2112;
            v271 = v8;
            _os_log_error_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "%@ trying to save a configuration with a bad plugin type (%@), plugin type for this client is %@", buf, 0x20u);
          }
LABEL_220:

          sub_100001CA0((uint64_t)NEHelperServer, v4, 10, 0);
          goto LABEL_9;
        }
      }
      else if (!v120)
      {
        int v230 = 1;
        goto LABEL_152;
      }
      if (!self->_hasProviderPermission)
      {
        v122 = ne_log_obj();
        if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
        {
          id v205 = objc_getProperty(self, v139, 64, 1);
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v205;
          _os_log_error_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "%@ is not allowed to save provider-based configurations", buf, 0xCu);
        }
        goto LABEL_220;
      }
      int v230 = 0;
LABEL_152:
      v144 = [v100 contentFilter];
      BOOL v145 = v144 == 0;

      if (v145) {
        goto LABEL_166;
      }
      id v147 = objc_getProperty(self, v146, 40, 1);
      unsigned __int8 v148 = sub_10001499C((uint64_t)NEHelperConfigurationManager, v147);
      self->_isCurrentAllowedContentFilterApp = v148;
      if (v148) {
        goto LABEL_166;
      }
      if (!v105 && !self->_isDevelopment && objc_getProperty(self, v149, 40, 1))
      {
        v150 = ne_log_obj();
        if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
        {
          id v214 = objc_getProperty(self, v151, 64, 1);
          id v216 = objc_getProperty(self, v215, 64, 1);
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v214;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v216;
          _os_log_error_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_ERROR, "%@ trying to create a content filter configuration through an app. Creating a content filter configuration is only allowed through profile in production version of %@.", buf, 0x16u);
        }

        sub_100001CA0((uint64_t)NEHelperServer, v4, 10, 0);
        goto LABEL_9;
      }
      if (!objc_opt_class()
        || (+[MCProfileConnection sharedConnection],
            v152 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v153 = [v152 isSupervised],
            v152,
            (v153 & 1) == 0))
      {
        v154 = [v100 externalIdentifier];
        BOOL v155 = v154 == 0;

        if (v155)
        {
          if (!self->_isDevelopment || !objc_getProperty(self, v156, 40, 1))
          {
            v122 = ne_log_obj();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
            {
              id v213 = objc_getProperty(self, v193, 64, 1);
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v213;
              _os_log_error_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "%@ trying to save a content filter configuration on an unsupervised device", buf, 0xCu);
            }
            goto LABEL_220;
          }
          v186 = ne_log_obj();
          if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
          {
            id v221 = objc_getProperty(self, v187, 64, 1);
            id v223 = objc_getProperty(self, v222, 64, 1);
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v221;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v223;
            _os_log_error_impl((void *)&_mh_execute_header, v186, OS_LOG_TYPE_ERROR, "Warning: allowing creation/modification of a content filter configuration on non-supervised device because the requesting app (%@) is a development version. This will not be allowed for the production version of %@", buf, 0x16u);
          }
        }
      }
      if (self->_superEntitled
        || ([v100 externalIdentifier], (v157 = objc_claimAutoreleasedReturnValue()) == 0)
        || ([v100 payloadInfo],
            v158 = objc_claimAutoreleasedReturnValue(),
            BOOL v159 = [v158 profileSource] == (id)2,
            v158,
            v157,
            v159))
      {
LABEL_166:
        v160 = [v100 dnsProxy];
        if (v160)
        {
          BOOL v161 = [v100 grade] == (id)2;

          if (!v161)
          {
            v162 = [v100 payloadInfo];
            BOOL v163 = v162 == 0;

            if (v163)
            {
              if (!self->_isDevelopment && !self->_platformEntitled)
              {
                v122 = ne_log_obj();
                if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
                {
                  id v218 = objc_getProperty(self, v168, 64, 1);
                  id v220 = objc_getProperty(self, v219, 64, 1);
                  *(_DWORD *)buf = 138412546;
                  *(void *)&buf[4] = v218;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v220;
                  _os_log_error_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "The production version of %@ is not allowed to create DNS proxy configurations. Use MDM to create DNS Proxy configurations for the production version of %@.", buf, 0x16u);
                }
                goto LABEL_220;
              }
            }
            else if (!v105)
            {
              if (!self->_platformEntitled
                || ([v100 payloadInfo],
                    v164 = objc_claimAutoreleasedReturnValue(),
                    BOOL v165 = [v164 profileSource] == (id)2,
                    v164,
                    !v165))
              {
                v166 = ne_log_obj();
                if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_ERROR, "DNS Proxy configurations can only be created via MDM", buf, 2u);
                }

                sub_100001CA0((uint64_t)NEHelperServer, v4, 21, 0);
                goto LABEL_9;
              }
            }
          }
        }
        v170 = [v100 dnsSettings];
        if (v170)
        {
          BOOL v171 = [v100 grade] == (id)1;

          if (v171)
          {
            if (objc_getProperty(self, v169, 40, 1))
            {
              v122 = ne_log_obj();
              if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
              {
                id v211 = objc_getProperty(self, v172, 64, 1);
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v211;
                _os_log_error_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "%@ trying to create an enterprise DNS Settings configuration through an app. Creating an enterprise DNS Settings configuration is only allowed through profile.", buf, 0xCu);
              }
              goto LABEL_220;
            }
          }
        }
        if (objc_getProperty(self, v169, 40, 1))
        {
          [v100 setApplicationIdentifier:[self objc_getProperty:v173, 40, 1]];
          [v100 setApplication:[self _application]];
          v176 = +[NELaunchServices bundleProxyForIdentifier:objc_getProperty(self, v175, 40, 1) uid:self->_userUID plugins:0];
          v177 = v176;
          if (v176)
          {
            v178 = [v176 name];
            [v100 setApplicationName:v178];
          }
        }
        if (self->_superEntitled) {
          goto LABEL_223;
        }
        v179 = [v100 VPN];
        if (v179)
        {
          int v229 = 0;
        }
        else
        {
          v228 = [v100 appVPN];
          if (v228)
          {
            int v229 = 0;
          }
          else
          {
            v227 = [v100 alwaysOnVPN];
            if (!v227) {
              goto LABEL_223;
            }
            v228 = 0;
            int v229 = 1;
          }
        }
        v180 = [v100 payloadInfo];
        if ([v180 profileSource] == (id)2)
        {

          int v181 = 0;
          if (v229) {
            goto LABEL_201;
          }
        }
        else
        {
          v182 = +[MCProfileConnection sharedConnection];
          if ([v182 isVPNCreationAllowed])
          {

            int v181 = 0;
          }
          else
          {
            v226 = +[MCProfileConnection sharedConnection];
            unsigned int v225 = [v226 isAppManaged:objc_getProperty(self, v184, 72, 1)];

            int v181 = v225 ^ 1;
          }
          if (v229)
          {
LABEL_201:

            if (v179) {
              goto LABEL_202;
            }
            goto LABEL_209;
          }
        }
        if (v179)
        {
LABEL_202:

          if (v181)
          {
LABEL_210:
            v122 = ne_log_obj();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
            {
              id v212 = objc_getProperty(self, v185, 64, 1);
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v212;
              _os_log_error_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "%@ cannot save configuration, vpn creation from app is restricted", buf, 0xCu);
            }
            goto LABEL_220;
          }
LABEL_223:
          if (self->_superEntitled) {
            goto LABEL_226;
          }
          v194 = [v100 dnsSettings];
          if (v194)
          {
LABEL_225:

LABEL_226:
            if (v230) {
              goto LABEL_231;
            }
            goto LABEL_227;
          }
          v194 = [v100 contentFilter];
          if (v194) {
            BOOL v202 = v8 != 0;
          }
          else {
            BOOL v202 = 0;
          }
          if (!v202)
          {
            id v203 = objc_getProperty(self, v201, 40, 1);
            if (!v203) {
              goto LABEL_225;
            }
            v204 = v203;
            if (!v230)
            {
              unsigned __int8 v210 = +[NETunnelProviderProtocol isLegacyPluginType:v121];

              if (v210)
              {
LABEL_227:
                v195 = [v100 appVPN];
                if (v195
                  || ([v100 contentFilter], (v195 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                }
                else
                {
                  v208 = [v100 dnsProxy];
                  BOOL v209 = v208 == 0;

                  if (v209) {
                    goto LABEL_231;
                  }
                }
                sub_100014B58((uint64_t)NEHelperConfigurationManager, v121, v100);
LABEL_231:
                v196 = +[NEConfigurationManager sharedManagerForAllUsers];
                id v198 = objc_getProperty(self, v197, 48, 1);
                id v200 = objc_getProperty(self, v199, 32, 1);
                v262[0] = _NSConcreteStackBlock;
                v262[1] = 3221225472;
                v262[2] = sub_100014FC4;
                v262[3] = &unk_1000392B8;
                id v263 = v4;
                [v196 saveConfigurationToDisk:v100 currentSignature:v105 userUUID:v198 isUpgrade:0 completionQueue:v200 completionHandler:v262];

                goto LABEL_9;
              }
LABEL_240:
              sub_100014A0C(self, v100, v105, v4);

              goto LABEL_9;
            }
          }
          goto LABEL_240;
        }
LABEL_209:

        if (v181) {
          goto LABEL_210;
        }
        goto LABEL_223;
      }
      v206 = ne_log_obj();
      if (os_log_type_enabled(v206, OS_LOG_TYPE_ERROR))
      {
        id v217 = objc_getProperty(self, v207, 64, 1);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v217;
        _os_log_error_impl((void *)&_mh_execute_header, v206, OS_LOG_TYPE_ERROR, "%@ perApp content filter configuration can only be created via MDM", buf, 0xCu);
      }

      sub_100001CA0((uint64_t)NEHelperServer, v4, 21, 0);
LABEL_9:

      return;
    case 4:
      if (self->_appGroupEntitled)
      {
        v97 = ne_log_obj();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = objc_getProperty(self, v98, 64, 1);
          _os_log_error_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%@ is not allowed to remove configurations because it is only app group entitled", buf, 0xCu);
        }

        sub_100001CA0((uint64_t)NEHelperServer, v4, 10, 0);
      }
      else
      {
        uuid = xpc_dictionary_get_uuid(v4, "config-identifier");
        if (!uuid) {
          goto LABEL_116;
        }
        id v82 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:uuid];
        v83 = ne_log_obj();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = objc_getProperty(self, v84, 64, 1);
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v82;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "%@ is removing configuration %@", buf, 0x16u);
        }

        v85 = +[NEConfigurationManager sharedManagerForAllUsers];
        id v87 = objc_getProperty(self, v86, 32, 1);
        v258[0] = _NSConcreteStackBlock;
        v258[1] = 3221225472;
        v258[2] = sub_100015014;
        v258[3] = &unk_100039308;
        v258[4] = self;
        char v261 = 0;
        id v259 = v4;
        id v260 = v82;
        id v88 = v82;
        [v85 loadConfigurationWithID:v88 withCompletionQueue:v87 handler:v258];
      }
      goto LABEL_9;
    case 5:
      *(void *)buf = 0;
      v89 = xpc_dictionary_get_data(v4, "identity-reference", (size_t *)buf);
      id v91 = objc_getProperty(self, v90, 40, 1);
      if (v91)
      {
      }
      else if (!self->_appGroupEntitled)
      {
        if (v89)
        {
          v112 = +[NSData dataWithBytesNoCopy:v89 length:*(void *)buf freeWhenDone:0];
        }
        else
        {
          v112 = 0;
        }
        id v113 = +[NEIdentityKeychainItem copyIdentities:v112 fromDomain:0];
        if (v113) {
          v114 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        }
        else {
          v114 = 0;
        }
        int64_t v115 = 0;
LABEL_98:
        sub_100001CA0((uint64_t)NEHelperServer, v4, v115, v114);

        goto LABEL_9;
      }
      v112 = 0;
      id v113 = 0;
      v114 = 0;
      int64_t v115 = 10;
      goto LABEL_98;
    case 6:
      sub_10001522C(self, v4);
      goto LABEL_9;
    case 7:
      if (!self->_superEntitled) {
        goto LABEL_116;
      }
      v41 = xpc_dictionary_get_uuid(v4, "config-identifier");
      if (!v41) {
        goto LABEL_116;
      }
      id v42 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v41];
      v43 = sub_1000153DC((uint64_t)NEHelperPendingOperation, v42);
      v45 = v43;
      if (v43 && v43[2] == 3)
      {
        v46 = [objc_getProperty(v43, v44, 32, 1) dnsProxy];
        BOOL v47 = v46 == 0;

        if (v47)
        {
          v140 = [objc_getProperty(v45, v48, 32, 1) contentFilter];
          BOOL v141 = v140 == 0;

          if (v141)
          {
            [objc_getProperty(v45, v142, 32, 1) relay];
          }
        }
        v189 = NEResourcesCopyLocalizedNSString();
        id v191 = objc_getProperty(self, v190, 32, 1);
        v255[0] = _NSConcreteStackBlock;
        v255[1] = 3221225472;
        v255[2] = sub_100015514;
        v255[3] = &unk_100039358;
        v255[4] = self;
        id v256 = v45;
        id v257 = v4;
        id v192 = v45;
        +[NEUserNotification promptForLocalAuthenticationWithReason:v189 completionQueue:v191 completionHandler:v255];
      }
      else
      {

LABEL_116:
        sub_100001CA0((uint64_t)NEHelperServer, v4, 8, 0);
      }
      goto LABEL_9;
    case 8:
      string = xpc_dictionary_get_string(v4, "client-name");
      if (string)
      {
        sub_10000CA2C();
        v50 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
        v51 = +[NSString stringWithUTF8String:string];
        id v52 = sub_10000E934(v50, v51);

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v271 = sub_1000156A8;
        v272 = sub_1000156D4;
        id v273 = 0;
        v251[0] = _NSConcreteStackBlock;
        v251[1] = 3221225472;
        v251[2] = sub_1000156DC;
        v251[3] = &unk_1000393A8;
        v253 = self;
        v254 = buf;
        id v252 = v4;
        v53 = objc_retainBlock(v251);
        v54 = objc_retainBlock(v53);
        v55 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v54;

        ((void (*)(void *, id, void))v53[2])(v53, v52, 0);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        sub_100001CA0((uint64_t)NEHelperServer, v4, 22, 0);
      }
      goto LABEL_9;
    case 9:
      v92 = xpc_dictionary_get_string(v4, "config-plugin-type");
      if (v92)
      {
        v93 = +[NSString stringWithUTF8String:v92];
        id v94 = sub_100015878(v93);

        if (isa_nsdictionary()) {
          v95 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        }
        else {
          v95 = 0;
        }
      }
      else
      {
        v95 = 0;
      }
      sub_100001CA0((uint64_t)NEHelperServer, v4, 0, v95);

      goto LABEL_9;
    case 11:
      sub_100015304(self, v4);
      goto LABEL_9;
    case 13:
      v56 = xpc_dictionary_get_value(v4, "config-ids");
      v57 = +[NEConfigurationManager sharedManagerForAllUsers];
      id v59 = objc_getProperty(self, v58, 32, 1);
      v241[0] = _NSConcreteStackBlock;
      v241[1] = 3221225472;
      v241[2] = sub_1000165D8;
      v241[3] = &unk_1000394C0;
      id v242 = v4;
      [v57 syncConfigurationsWithSC:v56 completionQueue:v59 completionHandler:v241];

      goto LABEL_9;
    case 14:
      v60 = xpc_dictionary_get_uuid(v4, "config-identifier");
      if (!v60)
      {
        v111 = ne_log_obj();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_ERROR, "Invalid configuration ID", buf, 2u);
        }
        goto LABEL_89;
      }
      BOOL v61 = xpc_dictionary_get_BOOL(v4, "enabled");
      id v62 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v60];
      v63 = +[NEConfigurationManager sharedManagerForAllUsers];
      id v65 = objc_getProperty(self, v64, 56, 1);
      id v67 = objc_getProperty(self, v66, 32, 1);
      v236[0] = _NSConcreteStackBlock;
      v236[1] = 3221225472;
      v236[2] = sub_1000165F4;
      v236[3] = &unk_100039510;
      id v237 = v62;
      id v238 = v4;
      v239 = self;
      BOOL v240 = v61;
      id v68 = v62;
      [v63 loadIndexWithFilter:v65 completionQueue:v67 handler:v236];

      goto LABEL_9;
    case 15:
      v69 = xpc_dictionary_get_string(v4, "app-bundle-id");
      BOOL v70 = xpc_dictionary_get_BOOL(v4, "enable-required");
      if (v69)
      {
        BOOL v71 = v70;
        v72 = +[NSString stringWithUTF8String:v69];
        v73 = +[NEConfigurationManager sharedManagerForAllUsers];
        id v75 = objc_getProperty(self, v74, 32, 1);
        v231[0] = _NSConcreteStackBlock;
        v231[1] = 3221225472;
        v231[2] = sub_1000167FC;
        v231[3] = &unk_100039538;
        BOOL v235 = v71;
        id v232 = v72;
        v233 = self;
        id v234 = v4;
        id v76 = v72;
        [v73 loadConfigurations:0 withFilter:0 completionQueue:v75 completionHandler:v231];
      }
      else
      {
        v111 = ne_log_obj();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_ERROR, "Failed to check config, invalid bundle ID", buf, 2u);
        }
LABEL_89:

        sub_100001CA0((uint64_t)NEHelperServer, v4, 22, 0);
      }
      goto LABEL_9;
    case 16:
      v77 = xpc_dictionary_get_string(v4, "bundle-id");
      int v78 = xpc_dictionary_get_int64(v4, "pid");
      v79 = (uint8_t *)xpc_dictionary_get_uuid(v4, "uuid");
      if (v79) {
        v79 = (uint8_t *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:v79];
      }
      if (!v77 && !v78)
      {
        v80 = ne_log_obj();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "Failed to get bundle ID or PID from message", buf, 2u);
        }
LABEL_50:

        sub_100001CA0((uint64_t)NEHelperServer, v4, 22, 0);
        goto LABEL_129;
      }
      if (v77)
      {
        v110 = +[NSString stringWithUTF8String:v77];
        if (!v110)
        {
          v80 = ne_log_obj();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v77;
            _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "Failed to convert BundleID for message (bundle_id: %s)", buf, 0xCu);
          }
          goto LABEL_50;
        }
      }
      else
      {
        v110 = 0;
      }
      v124 = xpc_dictionary_get_string(v4, "query");
      if (v124)
      {
        v125 = +[NSString stringWithUTF8String:v124];
        if (v125) {
          goto LABEL_128;
        }
        v126 = ne_log_obj();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v124;
          v127 = "Failed to convert query (query_string: %s)";
          v128 = v126;
          uint32_t v129 = 12;
LABEL_178:
          _os_log_debug_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEBUG, v127, buf, v129);
        }
      }
      else
      {
        v126 = ne_log_obj();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v127 = "No query string in message";
          v128 = v126;
          uint32_t v129 = 2;
          goto LABEL_178;
        }
      }

      v125 = 0;
LABEL_128:
      BOOL v132 = xpc_dictionary_get_BOOL(v4, "has-entitlement");
      v133 = sub_100015AC0();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100015B18;
      block[3] = &unk_100039498;
      id v244 = v110;
      id v245 = v4;
      v246 = self;
      int v249 = v78;
      v247 = v79;
      id v248 = v125;
      BOOL v250 = v132;
      id v134 = v125;
      id v135 = v110;
      dispatch_async(v133, block);

LABEL_129:
      goto LABEL_9;
    case 17:
      char v96 = xpc_dictionary_get_BOOL(v4, "reset-all");
      sub_1000159B0((uint64_t)NEHelperConfigurationManager, v96, 0, 0);
      goto LABEL_9;
    default:
      goto LABEL_9;
  }
}

- (OS_dispatch_queue)handlerQueue
{
  if (self)
  {
    self = (NEHelperConfigurationManager *)objc_getProperty(self, a2, 32, 1);
    uint64_t v2 = vars8;
  }
  return (OS_dispatch_queue *)self;
}

- (NSString)name
{
  return self->_bundleID;
}

- (NEHelperConfigurationManager)initWithFirstMessage:(id)a3
{
  id v4 = a3;
  v85.receiver = self;
  v85.super_class = (Class)NEHelperConfigurationManager;
  v5 = [(NEHelperConfigurationManager *)&v85 init];
  if (!v5)
  {
LABEL_86:
    v37 = v5;
    goto LABEL_87;
  }
  xpc_dictionary_get_remote_connection(v4);
  int64_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  pid_t pid = xpc_connection_get_pid(v6);
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("NEHelperConfigurationManager", v8);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v9;

  v5->_BOOL entitled = 0;
  uint64_t v11 = NECopyUserUUIDFromXPCEUID();
  userUUID = v5->_userUUID;
  v5->_userUUID = (NSUUID *)v11;

  v5->_userUID = xpc_connection_get_euid(v6);
  v5->_BOOL hasProviderPermission = 0;
  uint64_t v13 = NECopySigningIdentifierForXPCMessage();
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v13;

  id v15 = xpc_dictionary_get_value(v4, "preferred-languages");
  SEL v16 = v15;
  if (v15 && xpc_get_type(v15) == (xpc_type_t)&_xpc_type_array && xpc_array_get_count(v16))
  {
    v17 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    NEResourcesSetPreferredLanguages();
  }
  if (v5->_bundleID)
  {
    if (xpc_connection_is_extension())
    {
      v18 = v5->_bundleID;
      if (v18)
      {
        v19 = v18;
        id v20 = ne_log_obj();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v87 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Client is an extension with bundle identifier %@", buf, 0xCu);
        }

        v21 = +[LSPlugInKitProxy pluginKitProxyForIdentifier:v19];
        v22 = [v21 containingBundle];
        uint64_t v23 = [v22 bundleIdentifier];
        uint64_t v24 = v5->_bundleID;
        v5->_bundleID = (NSString *)v23;

        v25 = ne_log_obj();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = v5->_bundleID;
          *(_DWORD *)buf = 138412290;
          id v87 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Containing app for extension is %@", buf, 0xCu);
        }
      }
    }
    if (proc_name(pid, buffer, 0x40u) <= 0) {
      snprintf(buffer, 0x40uLL, "%d", pid);
    }
    uint64_t v27 = +[NSString stringWithUTF8String:buffer];
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v27;

    v29 = (void *)xpc_connection_copy_entitlement_value();
    v30 = v29;
    if (v29)
    {
      if (xpc_get_type(v29) == (xpc_type_t)&_xpc_type_array)
      {
        if (xpc_array_get_count(v30))
        {
          string = xpc_array_get_string(v30, 0);
          if (string)
          {
            BOOL v47 = string;
            size_t v48 = strlen(string);
            if (!strncmp(v47, "allow-vpn", v48))
            {
              objc_storeStrong((id *)&v5->_applicationID, v5->_bundleID);
              v5->_BOOL entitled = 1;
            }
          }
        }
      }
    }
    v31 = (void *)xpc_connection_copy_entitlement_value();

    if (v31 && xpc_get_type(v31) == (xpc_type_t)&_xpc_type_array && xpc_array_get_count(v31))
    {
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v49 = (id)_CFXPCCreateCFObjectFromXPCObject();
      v50 = (char *)[v49 countByEnumeratingWithState:&v81 objects:v97 count:16];
      SEL v32 = v49;
      if (v50)
      {
        v51 = v50;
        uint64_t v52 = *(void *)v82;
        while (2)
        {
          for (i = 0; i != v51; ++i)
          {
            if (*(void *)v82 != v52) {
              objc_enumerationMutation(v49);
            }
            if ((isa_nsstring() & 1) == 0)
            {

              SEL v32 = 0;
              goto LABEL_56;
            }
          }
          v51 = (char *)[v49 countByEnumeratingWithState:&v81 objects:v97 count:16];
          if (v51) {
            continue;
          }
          break;
        }
        SEL v32 = v49;
      }
LABEL_56:
    }
    else
    {
      SEL v32 = 0;
    }
    id v33 = (void *)xpc_connection_copy_entitlement_value();

    int v34 = NEGetEntitlement();
    id v76 = v32;
    if (v34)
    {
      char v35 = v34;
      objc_storeStrong((id *)&v5->_applicationID, v5->_bundleID);
      v5->_BOOL entitled = 1;
      v5->_BOOL hasProviderPermission = 1;
      if ((v35 & 4) != 0) {
        v5->_isCurrentAllowedContentFilterApp = sub_10001499C((uint64_t)NEHelperConfigurationManager, v5->_applicationID);
      }
      if (xpc_connection_is_extension()) {
        v5->_appGroupEntitled = 1;
      }
      else {
        objc_storeStrong((id *)&v5->_appGroups, v32);
      }
    }
    else if (!v5->_entitled && [v32 count])
    {
      v38 = +[NEConfigurationManager sharedManagerForAllUsers];
      id v39 = [v38 copyAppGroupMapDidChange:0];

      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v40 = v32;
      id v41 = [v40 countByEnumeratingWithState:&v77 objects:v96 count:16];
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v78;
        while (2)
        {
          for (j = 0; j != v42; j = (char *)j + 1)
          {
            if (*(void *)v78 != v43) {
              objc_enumerationMutation(v40);
            }
            uint64_t v45 = [v39 objectForKeyedSubscript:*(void *)(*((void *)&v77 + 1) + 8 * (void)j)];
            if (v45)
            {
              applicationID = v5->_applicationID;
              v5->_applicationID = (NSString *)v45;

              v5->_BOOL entitled = 1;
              v5->_BOOL hasProviderPermission = 1;
              v5->_appGroupEntitled = 1;
              goto LABEL_58;
            }
          }
          id v42 = [v40 countByEnumeratingWithState:&v77 objects:v96 count:16];
          if (v42) {
            continue;
          }
          break;
        }
      }
LABEL_58:
    }
    v55 = (void *)xpc_connection_copy_entitlement_value();
    v56 = v55;
    if (v55)
    {
      v5->_BOOL entitled = 1;
      v5->_BOOL hasProviderPermission = 1;
      v5->_platformEntitled = 1;
      if (xpc_get_type(v55) == (xpc_type_t)&_xpc_type_string)
      {
        string_ptr = xpc_string_get_string_ptr(v56);
        if (!strcmp(string_ptr, "super")) {
          v5->_superEntitled = 1;
        }
      }
      if (xpc_dictionary_get_BOOL(v4, "no-app-filter"))
      {
        SEL v58 = v5->_applicationID;
        v5->_applicationID = 0;
      }
      v5->_appGroupEntitled = 0;
    }
    id v59 = (void *)xpc_connection_copy_entitlement_value();
    v60 = v59;
    if (v59 && xpc_get_type(v59) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v60)) {
      v5->_spiEntitled = 1;
    }
    BOOL v61 = (void *)xpc_connection_copy_entitlement_value();
    id v62 = v61;
    BOOL v63 = v61 && xpc_get_type(v61) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v62);
    v5->_isDevelopment = v63;
    SEL v64 = (void *)xpc_connection_copy_entitlement_value();
    id v65 = v64;
    if (v64 && xpc_get_type(v64) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v65)) {
      v5->_isTestClient = 1;
    }
    SEL v66 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    filter = v5->_filter;
    v5->_filter = v66;

    if (!xpc_dictionary_get_BOOL(v4, "no-app-filter")) {
      [(NSMutableDictionary *)v5->_filter setObject:v5->_userUUID forKeyedSubscript:@"user-uuid"];
    }
    id v68 = v5->_applicationID;
    if (v68) {
      [(NSMutableDictionary *)v5->_filter setObject:v68 forKeyedSubscript:@"application-id"];
    }
    v69 = ne_log_obj();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      BOOL v70 = v5->_clientName;
      BOOL v71 = v5->_bundleID;
      v72 = v5->_applicationID;
      BOOL entitled = v5->_entitled;
      BOOL hasProviderPermission = v5->_hasProviderPermission;
      *(_DWORD *)buf = 138413314;
      id v87 = v70;
      __int16 v88 = 2112;
      v89 = v71;
      __int16 v90 = 2112;
      id v91 = v72;
      __int16 v92 = 1024;
      BOOL v93 = entitled;
      __int16 v94 = 1024;
      BOOL v95 = hasProviderPermission;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "Created a new configuration delegate with name = %@, bundleID = %@, applicationID = %@, BOOL entitled = %d, hasProviderPermission = %d", buf, 0x2Cu);
    }

    goto LABEL_86;
  }
  v36 = ne_log_obj();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Operation failed, client is not signed", buf, 2u);
  }

  v37 = 0;
LABEL_87:

  return v37;
}

@end