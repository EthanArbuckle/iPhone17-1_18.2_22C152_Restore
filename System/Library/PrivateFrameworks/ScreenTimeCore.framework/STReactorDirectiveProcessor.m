@interface STReactorDirectiveProcessor
- (OS_dispatch_queue)processingQueue;
- (OS_dispatch_queue)transportEnvoyQueue;
- (STBiomeEventWriter)biomeEventWriter;
- (STConfigurationStoreReader)configurationStore;
- (STDeviceStateReader)deviceStateStore;
- (STEyeReliefStateWriter)eyeReliefStateWriter;
- (STFamilyProviding)familyProvider;
- (STIDSTransportPrimitives)transportPrimitives;
- (STPrimitiveBackgroundActivityScheduler)backgroundActivityScheduler;
- (STReactorDirectiveProcessor)initWithQueue:(id)a3 transportEnvoy:(id)a4 transportEnvoyQueue:(id)a5 configurationStore:(id)a6 deviceStateStore:(id)a7 biomeEventWriter:(id)a8 backgroundActivityScheduler:(id)a9 familyProvider:(id)a10 eyeReliefStateWriter:(id)a11 userSafetyPolicyWriter:(id)a12 transportPrimitives:(id)a13;
- (STTransportEnvoy)transportEnvoy;
- (STUserSafetyPolicyWriter)userSafetyPolicyWriter;
- (id)_sendRepairConfigurationChangeRelatedToChange:(id)a3;
- (id)processDirective:(id)a3;
@end

@implementation STReactorDirectiveProcessor

- (STReactorDirectiveProcessor)initWithQueue:(id)a3 transportEnvoy:(id)a4 transportEnvoyQueue:(id)a5 configurationStore:(id)a6 deviceStateStore:(id)a7 biomeEventWriter:(id)a8 backgroundActivityScheduler:(id)a9 familyProvider:(id)a10 eyeReliefStateWriter:(id)a11 userSafetyPolicyWriter:(id)a12 transportPrimitives:(id)a13
{
  v19 = (OS_dispatch_queue *)a3;
  v20 = (STTransportEnvoy *)a4;
  v21 = (OS_dispatch_queue *)a5;
  v22 = (STConfigurationStoreReader *)a6;
  v23 = (STDeviceStateReader *)a7;
  v24 = (STBiomeEventWriter *)a8;
  v25 = (STPrimitiveBackgroundActivityScheduler *)a9;
  v47 = (STFamilyProviding *)a10;
  v26 = (STEyeReliefStateWriter *)a11;
  v48 = (STUserSafetyPolicyWriter *)a12;
  v49 = (STIDSTransportPrimitives *)a13;
  processingQueue = self->_processingQueue;
  self->_processingQueue = v19;
  v51 = v19;

  transportEnvoy = self->_transportEnvoy;
  self->_transportEnvoy = v20;
  v50 = v20;

  transportEnvoyQueue = self->_transportEnvoyQueue;
  self->_transportEnvoyQueue = v21;
  v30 = v21;

  configurationStore = self->_configurationStore;
  self->_configurationStore = v22;
  v32 = v22;

  deviceStateStore = self->_deviceStateStore;
  self->_deviceStateStore = v23;
  v34 = v23;

  biomeEventWriter = self->_biomeEventWriter;
  self->_biomeEventWriter = v24;
  v36 = v24;

  backgroundActivityScheduler = self->_backgroundActivityScheduler;
  self->_backgroundActivityScheduler = v25;
  v38 = v25;

  familyProvider = self->_familyProvider;
  self->_familyProvider = v47;
  v40 = v47;

  eyeReliefStateWriter = self->_eyeReliefStateWriter;
  self->_eyeReliefStateWriter = v26;
  v42 = v26;

  userSafetyPolicyWriter = self->_userSafetyPolicyWriter;
  self->_userSafetyPolicyWriter = v48;
  v44 = v48;

  transportPrimitives = self->_transportPrimitives;
  self->_transportPrimitives = v49;

  return self;
}

- (id)processDirective:(id)a3
{
  id v215 = a3;
  v214 = [v215 data];
  switch((unint64_t)[v215 type])
  {
    case 0uLL:
      v4 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "processing do nothing directive", (uint8_t *)&buf, 2u);
      }

      v5 = [[STReactorDirectiveProcessorResult alloc] initWithOutput:0 processedDirective:v215];
      id obj = +[STResult success:v5];

      uint64_t v6 = +[STPromise resolvedWith:obj];
      goto LABEL_98;
    case 1uLL:
      v7 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "processing compound directive", (uint8_t *)&buf, 2u);
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v142 = +[NSAssertionHandler currentHandler];
        v143 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STReactorDirectiveProcessor processDirective:]");
        v144 = (objc_class *)objc_opt_class();
        v145 = NSStringFromClass(v144);
        v146 = (objc_class *)objc_opt_class();
        v147 = NSStringFromClass(v146);
        [v142 handleFailureInFunction:v143, @"STReactorDirectiveProcessor.m", 306, @"expected %@, got %@", v145, v147 file lineNumber description];
      }
      id v8 = v214;
      v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
      long long v246 = 0u;
      long long v247 = 0u;
      long long v244 = 0u;
      long long v245 = 0u;
      id obj = v8;
      id v10 = [obj countByEnumeratingWithState:&v244 objects:v324 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v245;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v245 != v11) {
              objc_enumerationMutation(obj);
            }
            v13 = [(STReactorDirectiveProcessor *)self processDirective:*(void *)(*((void *)&v244 + 1) + 8 * i)];
            [v9 addObject:v13];
          }
          id v10 = [obj countByEnumeratingWithState:&v244 objects:v324 count:16];
        }
        while (v10);
      }

      v14 = [(STReactorDirectiveProcessor *)self processingQueue];
      v15 = +[STPromise onQueue:v14 all:v9];
      v16 = [v15 then];
      v242[0] = _NSConcreteStackBlock;
      v242[1] = 3221225472;
      v242[2] = sub_10006C800;
      v242[3] = &unk_1002FCA28;
      id v243 = v215;
      ((void (**)(void, void *))v16)[2](v16, v242);
      v3 = (STPromise *)objc_claimAutoreleasedReturnValue();

      goto LABEL_114;
    case 2uLL:
      v17 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "processing send message directive", (uint8_t *)&buf, 2u);
      }

      id obja = [(STReactorDirectiveProcessor *)self transportEnvoyQueue];
      v322[0] = _NSConcreteStackBlock;
      v322[1] = 3221225472;
      v322[2] = sub_10006BC00;
      v322[3] = &unk_1002FD780;
      v322[4] = self;
      id v323 = v214;
      v18 = +[STPromise onQueue:obja do:v322];
      v19 = [v18 then];
      v320[0] = _NSConcreteStackBlock;
      v320[1] = 3221225472;
      v320[2] = sub_10006BD24;
      v320[3] = &unk_1002FCC78;
      id v321 = v215;
      ((void (**)(void, void *))v19)[2](v19, v320);
      v3 = (STPromise *)objc_claimAutoreleasedReturnValue();

      break;
    case 3uLL:
      v20 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "processing read configuration directive", (uint8_t *)&buf, 2u);
      }

      v21 = [(STReactorDirectiveProcessor *)self configurationStore];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v148 = +[NSAssertionHandler currentHandler];
        v149 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STReactorDirectiveProcessor processDirective:]");
        v150 = (objc_class *)objc_opt_class();
        v151 = NSStringFromClass(v150);
        v152 = (objc_class *)objc_opt_class();
        v153 = NSStringFromClass(v152);
        [v148 handleFailureInFunction:v149, @"STReactorDirectiveProcessor.m", 105, @"expected %@, got %@", v151, v153 file lineNumber description];
      }
      id objb = [v21 readConfigurationRelatedToConfiguration:v214];

      v318[0] = _NSConcreteStackBlock;
      v318[1] = 3221225472;
      v318[2] = sub_10006BD6C;
      v318[3] = &unk_1002FDBF0;
      id v319 = v215;
      v22 = [objb map:v318];
      v3 = +[STPromise resolvedWith:v22];

      break;
    case 4uLL:
      v23 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "processing write configuration directive", (uint8_t *)&buf, 2u);
      }

      v24 = [(STReactorDirectiveProcessor *)self configurationStore];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v154 = +[NSAssertionHandler currentHandler];
        v155 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STReactorDirectiveProcessor processDirective:]");
        v156 = (objc_class *)objc_opt_class();
        v157 = NSStringFromClass(v156);
        v158 = (objc_class *)objc_opt_class();
        v159 = NSStringFromClass(v158);
        [v154 handleFailureInFunction:v155, @"STReactorDirectiveProcessor.m", 115, @"expected %@, got %@", v157, v159 file lineNumber description];
      }
      id objc = [v24 writeConfigurationChange:v214];

      v316[0] = _NSConcreteStackBlock;
      v316[1] = 3221225472;
      v316[2] = sub_10006BDD4;
      v316[3] = &unk_1002FDC18;
      id v317 = v215;
      v25 = [objc map:v316];
      v26 = [STPromise alloc];
      v27 = [(STReactorDirectiveProcessor *)self processingQueue];
      v3 = [(STPromise *)v26 initWithResolution:v25 onQueue:v27];

      break;
    case 5uLL:
      v28 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "processing respond with current configuration directive", (uint8_t *)&buf, 2u);
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v160 = +[NSAssertionHandler currentHandler];
        v161 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STReactorDirectiveProcessor processDirective:]");
        v162 = (objc_class *)objc_opt_class();
        v163 = NSStringFromClass(v162);
        v164 = (objc_class *)objc_opt_class();
        v165 = NSStringFromClass(v164);
        [v160 handleFailureInFunction:v161, @"STReactorDirectiveProcessor.m", 123, @"expected %@, got %@", v163, v165 file lineNumber description];
      }
      id v29 = v214;
      id objd = [(STReactorDirectiveProcessor *)self _sendRepairConfigurationChangeRelatedToChange:v29];
      v30 = [objd then];
      v313[0] = _NSConcreteStackBlock;
      v313[1] = 3221225472;
      v313[2] = sub_10006BE3C;
      v313[3] = &unk_1002FD928;
      id v314 = v29;
      id v315 = v215;
      v31 = (void (*)(void *, void *))v30[2];
      id v32 = v29;
      v31(v30, v313);
      v3 = (STPromise *)objc_claimAutoreleasedReturnValue();

      break;
    case 6uLL:
      v33 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "processing write device state directive", (uint8_t *)&buf, 2u);
      }

      v34 = [(STReactorDirectiveProcessor *)self deviceStateStore];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v166 = +[NSAssertionHandler currentHandler];
        v167 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STReactorDirectiveProcessor processDirective:]");
        v168 = (objc_class *)objc_opt_class();
        v169 = NSStringFromClass(v168);
        v170 = (objc_class *)objc_opt_class();
        v171 = NSStringFromClass(v170);
        [v166 handleFailureInFunction:v167, @"STReactorDirectiveProcessor.m", 131, @"expected %@, got %@", v169, v171 file lineNumber description];
      }
      id obje = [v34 writeDeviceStateChange:v214];

      v311[0] = _NSConcreteStackBlock;
      v311[1] = 3221225472;
      v311[2] = sub_10006BF14;
      v311[3] = &unk_1002FCC78;
      id v312 = v215;
      v35 = [obje map:v311];
      v3 = +[STPromise resolvedWith:v35];

      break;
    case 7uLL:
      objc_opt_class();
      v36 = v214;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v172 = +[NSAssertionHandler currentHandler];
        v173 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STReactorDirectiveProcessor processDirective:]");
        v174 = (objc_class *)objc_opt_class();
        v175 = NSStringFromClass(v174);
        v176 = (objc_class *)objc_opt_class();
        v177 = NSStringFromClass(v176);
        [v172 handleFailureInFunction:v173, @"STReactorDirectiveProcessor.m", 138, @"expected %@, got %@", v175, v177 file lineNumber description];

        v36 = v214;
      }
      id v37 = v36;
      id v38 = [v37 type];
      v39 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        if ((unint64_t)v38 > 3) {
          CFStringRef v40 = &stru_10030A6D8;
        }
        else {
          CFStringRef v40 = *(&off_1002FDD90 + (void)v38);
        }
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "processing schedule background activity directive type: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      switch((unint64_t)v38)
      {
        case 0uLL:
        case 2uLL:
          id obj = [(STReactorDirectiveProcessor *)self transportEnvoyQueue];
          break;
        case 1uLL:
        case 3uLL:
          id obj = [(STReactorDirectiveProcessor *)self processingQueue];
          break;
        default:
          id obj = 0;
          break;
      }
      v132 = +[STPromise doOn];
      v307[0] = _NSConcreteStackBlock;
      v307[1] = 3221225472;
      v307[2] = sub_10006BF5C;
      v307[3] = &unk_1002FDC40;
      id v310 = v38;
      v307[4] = self;
      id v308 = v37;
      id v309 = v215;
      v133 = (void (*)(void *, id, void *))v132[2];
      id v134 = v37;
      v133(v132, obj, v307);
      v3 = (STPromise *)objc_claimAutoreleasedReturnValue();

      goto LABEL_114;
    case 8uLL:
      objc_opt_class();
      v41 = v214;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v178 = +[NSAssertionHandler currentHandler];
        v179 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STReactorDirectiveProcessor processDirective:]");
        v180 = (objc_class *)objc_opt_class();
        v181 = NSStringFromClass(v180);
        v182 = (objc_class *)objc_opt_class();
        v183 = NSStringFromClass(v182);
        [v178 handleFailureInFunction:v179, @"STReactorDirectiveProcessor.m", 178, @"expected %@, got %@", v181, v183 file lineNumber description];

        v41 = v214;
      }
      id v42 = [v41 integerValue];
      v43 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        if ((unint64_t)v42 > 3) {
          CFStringRef v44 = &stru_10030A6D8;
        }
        else {
          CFStringRef v44 = *(&off_1002FDD90 + (void)v42);
        }
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "processing perform background activity directive type:  %{public}@", (uint8_t *)&buf, 0xCu);
      }

      switch((unint64_t)v42)
      {
        case 0uLL:
          objk = +[STPromise doOn];
          v101 = [(STReactorDirectiveProcessor *)self transportEnvoyQueue];
          v306[0] = _NSConcreteStackBlock;
          v306[1] = 3221225472;
          v306[2] = sub_10006C06C;
          v306[3] = &unk_1002FD6F0;
          v306[4] = self;
          v102 = objk[2](objk, v101, v306);
          v103 = [v102 then];
          v304[0] = _NSConcreteStackBlock;
          v304[1] = 3221225472;
          v304[2] = sub_10006C0BC;
          v304[3] = &unk_1002FDC18;
          id v305 = v215;
          ((void (**)(void, void *))v103)[2](v103, v304);
          v3 = (STPromise *)objc_claimAutoreleasedReturnValue();

          break;
        case 1uLL:
          objl = +[STPromise doOn];
          v108 = [(STReactorDirectiveProcessor *)self transportEnvoyQueue];
          v303[0] = _NSConcreteStackBlock;
          v303[1] = 3221225472;
          v303[2] = sub_10006C124;
          v303[3] = &unk_1002FD6F0;
          v303[4] = self;
          v109 = objl[2](objl, v108, v303);
          v110 = [v109 then];
          v301[0] = _NSConcreteStackBlock;
          v301[1] = 3221225472;
          v301[2] = sub_10006C188;
          v301[3] = &unk_1002FDC18;
          id v302 = v215;
          ((void (**)(void, void *))v110)[2](v110, v301);
          v3 = (STPromise *)objc_claimAutoreleasedReturnValue();

          break;
        case 2uLL:
          objm = +[STPromise doOn];
          v111 = [(STReactorDirectiveProcessor *)self transportEnvoyQueue];
          v300[0] = _NSConcreteStackBlock;
          v300[1] = 3221225472;
          v300[2] = sub_10006C1F0;
          v300[3] = &unk_1002FD6F0;
          v300[4] = self;
          v112 = objm[2](objm, v111, v300);
          v113 = [v112 then];
          v298[0] = _NSConcreteStackBlock;
          v298[1] = 3221225472;
          v298[2] = sub_10006C254;
          v298[3] = &unk_1002FDC18;
          id v299 = v215;
          ((void (**)(void, void *))v113)[2](v113, v298);
          v3 = (STPromise *)objc_claimAutoreleasedReturnValue();

          break;
        case 3uLL:
          v114 = +[STLog reactorDirectiveProcessor];
          if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "processing write downtime state biome event directive", (uint8_t *)&buf, 2u);
          }

          v115 = [(STReactorDirectiveProcessor *)self familyProvider];
          id obj = [v115 fetchTargetableFamilyMembersWithError:0];

          v116 = [(STReactorDirectiveProcessor *)self configurationStore];
          v117 = [v116 downtimeConfigurationOfChildrenByUserIDForTargetableFamilyMembers:obj];

          long long v296 = 0u;
          long long v297 = 0u;
          long long v294 = 0u;
          long long v295 = 0u;
          id v218 = v117;
          v118 = 0;
          id v119 = [v218 countByEnumeratingWithState:&v294 objects:v331 count:16];
          if (v119)
          {
            uint64_t v216 = *(void *)v295;
            do
            {
              v120 = 0;
              v121 = v118;
              do
              {
                if (*(void *)v295 != v216) {
                  objc_enumerationMutation(v218);
                }
                uint64_t v122 = *(void *)(*((void *)&v294 + 1) + 8 * (void)v120);
                v123 = [v218 objectForKeyedSubscript:v122];
                v124 = [STDowntimeStateEvent alloc];
                v125 = objc_opt_new();
                v126 = [v125 UUIDString];
                id v127 = [v123 currentState];
                v128 = [v123 currentDate];
                v129 = [(STDowntimeStateEvent *)v124 initWithIdentifier:v126 downtimeConfigurationState:v127 downtimeDate:v128 userID:v122];

                v130 = [(STReactorDirectiveProcessor *)self biomeEventWriter];
                v118 = [v130 writeDowntimeStateEvent:v129];

                v120 = (char *)v120 + 1;
                v121 = v118;
              }
              while (v119 != v120);
              id v119 = [v218 countByEnumeratingWithState:&v294 objects:v331 count:16];
            }
            while (v119);
          }

          v292[0] = _NSConcreteStackBlock;
          v292[1] = 3221225472;
          v292[2] = sub_10006C2BC;
          v292[3] = &unk_1002FCC78;
          id v293 = v215;
          v131 = [v118 map:v292];
          v3 = +[STPromise resolvedWith:v131];

          goto LABEL_114;
        default:
          goto LABEL_93;
      }
      break;
    case 9uLL:
LABEL_93:
      v104 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "processing cancel background activity directive", (uint8_t *)&buf, 2u);
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v136 = +[NSAssertionHandler currentHandler];
        v137 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STReactorDirectiveProcessor processDirective:]");
        v138 = (objc_class *)objc_opt_class();
        v139 = NSStringFromClass(v138);
        v140 = (objc_class *)objc_opt_class();
        v141 = NSStringFromClass(v140);
        [v136 handleFailureInFunction:v137, @"STReactorDirectiveProcessor.m", 222, @"expected %@, got %@", v139, v141 file lineNumber description];
      }
      id v105 = [v214 integerValue];
      v106 = [(STReactorDirectiveProcessor *)self backgroundActivityScheduler];
      [v106 invalidateBackgroundActivityOfType:v105];

      v107 = [[STReactorDirectiveProcessorResult alloc] initWithOutput:0 processedDirective:v215];
      id obj = +[STResult success:v107];

      uint64_t v6 = +[STPromise resolvedWith:obj];
LABEL_98:
      v3 = (STPromise *)v6;
      goto LABEL_114;
    case 0xAuLL:
      v45 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "processing read response data for checkin", (uint8_t *)&buf, 2u);
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v184 = +[NSAssertionHandler currentHandler];
        v185 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STReactorDirectiveProcessor processDirective:]");
        v186 = (objc_class *)objc_opt_class();
        v187 = NSStringFromClass(v186);
        v188 = (objc_class *)objc_opt_class();
        v189 = NSStringFromClass(v188);
        [v184 handleFailureInFunction:v185, @"STReactorDirectiveProcessor.m", 229, @"expected %@, got %@", v187, v189 file lineNumber description];
      }
      id objf = v214;
      v46 = [(STReactorDirectiveProcessor *)self familyProvider];
      v47 = [v46 fetchTargetableFamilyMembersWithError:0];

      v48 = +[STReactorCore userToRespondForGivenCheckingInUser:objf targetableFamilyMembers:v47];
      v49 = [(STReactorDirectiveProcessor *)self deviceStateStore];
      v50 = [v49 readDeviceStateChangeForLocalDevice];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v327 = 0x3032000000;
      v328 = sub_10006C304;
      v329 = sub_10006C314;
      id v330 = (id)objc_opt_new();
      v51 = [(STReactorDirectiveProcessor *)self configurationStore];
      v52 = [v51 readConfigurationChangesOfType:1 userID:v48];
      v291[0] = _NSConcreteStackBlock;
      v291[1] = 3221225472;
      v291[2] = sub_10006C31C;
      v291[3] = &unk_1002FDC68;
      v291[4] = &buf;
      [v52 evaluateWithSuccess:v291 failure:&stru_1002FDC88];

      uint64_t v285 = 0;
      v286 = &v285;
      uint64_t v287 = 0x3032000000;
      v288 = sub_10006C304;
      v289 = sub_10006C314;
      id v290 = (id)objc_opt_new();
      v53 = [(STReactorDirectiveProcessor *)self configurationStore];
      v54 = [v53 readConfigurationChangesOfType:2 userID:v48];
      v284[0] = _NSConcreteStackBlock;
      v284[1] = 3221225472;
      v284[2] = sub_10006C388;
      v284[3] = &unk_1002FDC68;
      v284[4] = &v285;
      [v54 evaluateWithSuccess:v284 failure:&stru_1002FDCA8];

      uint64_t v278 = 0;
      v279 = &v278;
      uint64_t v280 = 0x3032000000;
      v281 = sub_10006C304;
      v282 = sub_10006C314;
      id v283 = (id)objc_opt_new();
      v55 = [(STReactorDirectiveProcessor *)self configurationStore];
      v56 = [v55 readConfigurationChangesOfType:3 userID:v48];
      v277[0] = _NSConcreteStackBlock;
      v277[1] = 3221225472;
      v277[2] = sub_10006C3F4;
      v277[3] = &unk_1002FDC68;
      v277[4] = &v278;
      [v56 evaluateWithSuccess:v277 failure:&stru_1002FDCC8];

      uint64_t v271 = 0;
      v272 = &v271;
      uint64_t v273 = 0x3032000000;
      v274 = sub_10006C304;
      v275 = sub_10006C314;
      id v276 = (id)objc_opt_new();
      v57 = [(STReactorDirectiveProcessor *)self configurationStore];
      v58 = [v57 readConfigurationChangesOfType:4 userID:v48];
      v270[0] = _NSConcreteStackBlock;
      v270[1] = 3221225472;
      v270[2] = sub_10006C460;
      v270[3] = &unk_1002FDC68;
      v270[4] = &v271;
      [v58 evaluateWithSuccess:v270 failure:&stru_1002FDCE8];

      uint64_t v264 = 0;
      v265 = &v264;
      uint64_t v266 = 0x3032000000;
      v267 = sub_10006C304;
      v268 = sub_10006C314;
      id v269 = (id)objc_opt_new();
      v59 = [(STReactorDirectiveProcessor *)self configurationStore];
      v60 = [v59 readConfigurationChangesOfType:5 userID:v48];
      v263[0] = _NSConcreteStackBlock;
      v263[1] = 3221225472;
      v263[2] = sub_10006C4CC;
      v263[3] = &unk_1002FDC68;
      v263[4] = &v264;
      [v60 evaluateWithSuccess:v263 failure:&stru_1002FDD08];

      uint64_t v257 = 0;
      v258 = &v257;
      uint64_t v259 = 0x3032000000;
      v260 = sub_10006C304;
      v261 = sub_10006C314;
      id v262 = (id)objc_opt_new();
      v61 = [(STReactorDirectiveProcessor *)self configurationStore];
      v62 = [v61 readConfigurationChangesOfType:6 userID:v48];
      v256[0] = _NSConcreteStackBlock;
      v256[1] = 3221225472;
      v256[2] = sub_10006C538;
      v256[3] = &unk_1002FDC68;
      v256[4] = &v257;
      [v62 evaluateWithSuccess:v256 failure:&stru_1002FDD28];

      v63 = [v50 value];
      v64 = +[STMessageReactorCoreComponent buildCheckinResponseMessageEnvelopeForUser:objf targetableFamilyMembers:v47 localDeviceStateChange:v63 settingsChanges:*(void *)(*((void *)&buf + 1) + 40) downtimeChanges:v286[5] communicationLimitsChanges:v279[5] alwaysAllowedChanges:v272[5] restrictionsChanges:v265[5] managedUserChanges:v258[5]];

      v65 = [[STReactorDirectiveProcessorResult alloc] initWithOutput:v64 processedDirective:v215];
      v66 = +[STResult success:v65];

      v67 = [STPromise alloc];
      v68 = [(STReactorDirectiveProcessor *)self processingQueue];
      v3 = [(STPromise *)v67 initWithResolution:v66 onQueue:v68];

      _Block_object_dispose(&v257, 8);
      _Block_object_dispose(&v264, 8);

      _Block_object_dispose(&v271, 8);
      _Block_object_dispose(&v278, 8);

      _Block_object_dispose(&v285, 8);
      _Block_object_dispose(&buf, 8);

      break;
    case 0xDuLL:
      v69 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "processing write ask for time request biome event directive", (uint8_t *)&buf, 2u);
      }

      v70 = [(STReactorDirectiveProcessor *)self biomeEventWriter];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v190 = +[NSAssertionHandler currentHandler];
        v191 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STReactorDirectiveProcessor processDirective:]");
        v192 = (objc_class *)objc_opt_class();
        v193 = NSStringFromClass(v192);
        v194 = (objc_class *)objc_opt_class();
        v195 = NSStringFromClass(v194);
        [v190 handleFailureInFunction:v191, @"STReactorDirectiveProcessor.m", 318, @"expected %@, got %@", v193, v195 file lineNumber description];
      }
      id objg = [v70 writeAskForTimeRequestEvent:v214];

      v240[0] = _NSConcreteStackBlock;
      v240[1] = 3221225472;
      v240[2] = sub_10006C868;
      v240[3] = &unk_1002FCC78;
      id v241 = v215;
      v71 = [objg map:v240];
      v3 = +[STPromise resolvedWith:v71];

      break;
    case 0xEuLL:
      v72 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "processing write ask for time response biome event directive", (uint8_t *)&buf, 2u);
      }

      v73 = [(STReactorDirectiveProcessor *)self biomeEventWriter];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v196 = +[NSAssertionHandler currentHandler];
        v197 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STReactorDirectiveProcessor processDirective:]");
        v198 = (objc_class *)objc_opt_class();
        v199 = NSStringFromClass(v198);
        v200 = (objc_class *)objc_opt_class();
        v201 = NSStringFromClass(v200);
        [v196 handleFailureInFunction:v197, @"STReactorDirectiveProcessor.m", 326, @"expected %@, got %@", v199, v201 file lineNumber description];
      }
      id objh = [v73 writeAskForTimeResponseEvent:v214];

      v238[0] = _NSConcreteStackBlock;
      v238[1] = 3221225472;
      v238[2] = sub_10006C8B0;
      v238[3] = &unk_1002FCC78;
      id v239 = v215;
      v74 = [objh map:v238];
      v3 = +[STPromise resolvedWith:v74];

      break;
    case 0xFuLL:
      v75 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "processing write eye relief state directive", (uint8_t *)&buf, 2u);
      }

      v76 = [(STReactorDirectiveProcessor *)self eyeReliefStateWriter];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v202 = +[NSAssertionHandler currentHandler];
        v203 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STReactorDirectiveProcessor processDirective:]");
        v204 = (objc_class *)objc_opt_class();
        v205 = NSStringFromClass(v204);
        v206 = (objc_class *)objc_opt_class();
        v207 = NSStringFromClass(v206);
        [v202 handleFailureInFunction:v203, @"STReactorDirectiveProcessor.m", 334, @"expected %@, got %@", v205, v207 file lineNumber description];
      }
      objc_msgSend(v76, "writeEyeReliefState:", objc_msgSend(v214, "BOOLValue"));
      id obji = (id)objc_claimAutoreleasedReturnValue();

      v236[0] = _NSConcreteStackBlock;
      v236[1] = 3221225472;
      v236[2] = sub_10006C8F8;
      v236[3] = &unk_1002FCC78;
      id v237 = v215;
      v77 = [obji map:v236];
      v3 = +[STPromise resolvedWith:v77];

      break;
    case 0x10uLL:
      v78 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "processing write user safety policy directive", (uint8_t *)&buf, 2u);
      }

      v79 = [(STReactorDirectiveProcessor *)self userSafetyPolicyWriter];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v208 = +[NSAssertionHandler currentHandler];
        v209 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STReactorDirectiveProcessor processDirective:]");
        v210 = (objc_class *)objc_opt_class();
        v211 = NSStringFromClass(v210);
        v212 = (objc_class *)objc_opt_class();
        v213 = NSStringFromClass(v212);
        [v208 handleFailureInFunction:v209, @"STReactorDirectiveProcessor.m", 342, @"expected %@, got %@", v211, v213 file lineNumber description];
      }
      objc_msgSend(v79, "writeUserSafetyInterventionPolicy:", objc_msgSend(v214, "integerValue"));
      id objj = (id)objc_claimAutoreleasedReturnValue();

      v234[0] = _NSConcreteStackBlock;
      v234[1] = 3221225472;
      v234[2] = sub_10006C940;
      v234[3] = &unk_1002FCC78;
      id v235 = v215;
      v80 = [objj map:v234];
      v3 = +[STPromise resolvedWith:v80];

      break;
    case 0x11uLL:
      v81 = +[STLog reactorDirectiveProcessor];
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "processing setup directive", (uint8_t *)&buf, 2u);
      }

      v82 = [(STReactorDirectiveProcessor *)self familyProvider];
      v83 = [v82 fetchTargetableFamilyMembersWithError:0];

      long long v254 = 0u;
      long long v255 = 0u;
      long long v252 = 0u;
      long long v253 = 0u;
      id obj = v83;
      id v84 = [obj countByEnumeratingWithState:&v252 objects:v325 count:16];
      if (v84)
      {
        id v217 = *(id *)v253;
        do
        {
          for (j = 0; j != v84; j = (char *)j + 1)
          {
            if (*(id *)v253 != v217) {
              objc_enumerationMutation(obj);
            }
            v86 = *(void **)(*((void *)&v252 + 1) + 8 * (void)j);
            id v87 = objc_alloc((Class)STUserID);
            v88 = [v86 dsid];
            id v89 = [v87 initWithDSID:v88];

            v90 = +[STPromise doOn];
            v91 = [(STReactorDirectiveProcessor *)self processingQueue];
            v249[0] = _NSConcreteStackBlock;
            v249[1] = 3221225472;
            v249[2] = sub_10006C5A4;
            v249[3] = &unk_1002FD780;
            id v250 = v89;
            v251 = self;
            v92 = (void (*)(void *, void *, void *))v90[2];
            id v93 = v89;
            v94 = v92(v90, v91, v249);
            v95 = [v94 then];
            v248[0] = _NSConcreteStackBlock;
            v248[1] = 3221225472;
            v248[2] = sub_10006C69C;
            v248[3] = &unk_1002FD7A8;
            v248[4] = self;
            v96 = ((void (**)(void, void *))v95)[2](v95, v248);
            v97 = [v96 catch];
            id v98 = (id)((uint64_t (**)(void, Block_layout *))v97)[2](v97, &stru_1002FDD48);
          }
          id v84 = [obj countByEnumeratingWithState:&v252 objects:v325 count:16];
        }
        while (v84);
      }

      v99 = [[STReactorDirectiveProcessorResult alloc] initWithOutput:0 processedDirective:v215];
      v100 = +[STResult success:v99];

      v3 = +[STPromise resolvedWith:v100];

LABEL_114:
      break;
    default:
      break;
  }

  return v3;
}

- (id)_sendRepairConfigurationChangeRelatedToChange:(id)a3
{
  id v4 = a3;
  v5 = +[STPromise doOn];
  uint64_t v6 = [(STReactorDirectiveProcessor *)self processingQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10006CB6C;
  v17[3] = &unk_1002FD780;
  v17[4] = self;
  id v18 = v4;
  v7 = (void (*)(void *, void *, void *))v5[2];
  id v8 = v4;
  v9 = v7(v5, v6, v17);
  id v10 = [v9 then];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10006CBC4;
  v16[3] = &unk_1002FDBF0;
  v16[4] = self;
  uint64_t v11 = ((void (**)(void, void *))v10)[2](v10, v16);
  v12 = [v11 then];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006CC98;
  v15[3] = &unk_1002FDD70;
  v15[4] = self;
  v13 = ((void (**)(void, void *))v12)[2](v12, v15);

  return v13;
}

- (OS_dispatch_queue)processingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (STTransportEnvoy)transportEnvoy
{
  return (STTransportEnvoy *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)transportEnvoyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (STConfigurationStoreReader)configurationStore
{
  return (STConfigurationStoreReader *)objc_getProperty(self, a2, 32, 1);
}

- (STDeviceStateReader)deviceStateStore
{
  return (STDeviceStateReader *)objc_getProperty(self, a2, 40, 1);
}

- (STBiomeEventWriter)biomeEventWriter
{
  return (STBiomeEventWriter *)objc_getProperty(self, a2, 48, 1);
}

- (STPrimitiveBackgroundActivityScheduler)backgroundActivityScheduler
{
  return (STPrimitiveBackgroundActivityScheduler *)objc_getProperty(self, a2, 56, 1);
}

- (STFamilyProviding)familyProvider
{
  return (STFamilyProviding *)objc_getProperty(self, a2, 64, 1);
}

- (STEyeReliefStateWriter)eyeReliefStateWriter
{
  return (STEyeReliefStateWriter *)objc_getProperty(self, a2, 72, 1);
}

- (STUserSafetyPolicyWriter)userSafetyPolicyWriter
{
  return (STUserSafetyPolicyWriter *)objc_getProperty(self, a2, 80, 1);
}

- (STIDSTransportPrimitives)transportPrimitives
{
  return (STIDSTransportPrimitives *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportPrimitives, 0);
  objc_storeStrong((id *)&self->_userSafetyPolicyWriter, 0);
  objc_storeStrong((id *)&self->_eyeReliefStateWriter, 0);
  objc_storeStrong((id *)&self->_familyProvider, 0);
  objc_storeStrong((id *)&self->_backgroundActivityScheduler, 0);
  objc_storeStrong((id *)&self->_biomeEventWriter, 0);
  objc_storeStrong((id *)&self->_deviceStateStore, 0);
  objc_storeStrong((id *)&self->_configurationStore, 0);
  objc_storeStrong((id *)&self->_transportEnvoyQueue, 0);
  objc_storeStrong((id *)&self->_transportEnvoy, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

@end